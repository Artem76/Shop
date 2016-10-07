package app.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    private UserDetailsService userDetailsService;

    @Autowired
    public void registerGlobalAuthentication(AuthenticationManagerBuilder auth) throws Exception {
        auth
                .userDetailsService(userDetailsService)//с помощью какого обьекта спрингу обращатся к учетным записям
                .passwordEncoder(getShaPasswordEncoder());//обьект преобразования паролей
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {//конфигурация работы спрингсекьюрити
        http
                .csrf().disable()//отключение защиты
                .authorizeRequests()//все страницы авторизовать
                .antMatchers("/shop").hasAnyRole("USER", "ADMIN", "MANAGER")//кого пускать в конкретный юрл по роли
                .antMatchers("/user**").hasRole("USER")
                .antMatchers("/admin**").hasRole("ADMIN")
                .antMatchers("/manager**").hasRole("MANAGER")
                .and()
        .exceptionHandling().accessDeniedPage("/")//страница в случае вызова недопустимой страницы
                .and()
        .formLogin()
                .loginPage("/login")//страница ввода логина и пароля
                .loginProcessingUrl("/j_spring_security_check")//куда отправлять пост запрос с логином и паролем
                .failureUrl("/login?error")//куда перекинуть если логин или пароль неправильны
                .usernameParameter("j_login")
                .passwordParameter("j_password")
                .permitAll()//доступен всем
                .and()
        .logout()
                .permitAll()
                .logoutUrl("/logout")
                .logoutSuccessUrl("/")//выхоод из сесии
                .invalidateHttpSession(true);//прибить сесию
    }

    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring()
                .antMatchers("/js/**")
                .antMatchers("/css/**")
                .antMatchers("/images/**")
                .antMatchers("/fonts/**");
    }

    @Bean
    public ShaPasswordEncoder getShaPasswordEncoder(){
        return new ShaPasswordEncoder();
    }
}

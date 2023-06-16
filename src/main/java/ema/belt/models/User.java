package ema.belt.models;



import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import java.util.List;




@Entity
@Table(name="users")
public class User {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @NotEmpty(message="from 3 to 30 characters")
    @Size(min=3, max=30, message="name is required!")
    private String userName;
    
    @NotEmpty(message="email is required!")
    @Email(message="enter a valid email!")
    private String email;
    
    @NotEmpty(message="password is required!")
    @Size(min=8, max=128, message="from 8 to 128 characters")
    private String password;
    
    @Transient
    @NotEmpty()
    @Size(min=8, max=128, message="required!")
    private String confirm;

    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
    private List <Course> courses;

    public User() {

    }


    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUserName() {
        return this.userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirm() {
        return this.confirm;
    }

    public void setConfirm(String confirm) {
        this.confirm = confirm;
    }

    public List<Course> getCourses() {
        return this.courses;
    }

    public void setCourses(List<Course> courses) {
        this.courses = courses;
    }


}
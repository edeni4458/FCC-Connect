package ema.belt.models;





import java.time.LocalDate;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;



@Entity
@Table(name="courses")
public class Course {
    

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotEmpty(message = "name required!")
    @Size(min = 3, max = 200)
    private String name;
    
    @NotEmpty(message = "day required!")
    @Size(min = 3, max = 200)
    private String day;
    
    private Integer price;
    
    @NotEmpty(message = "set a time!")
    @Size(min = 0, max = 13)
    private String time;

    @NotEmpty(message = "choose one!")
    private String amPm;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate date;

    @NotEmpty(message = "description required!")
    @Size(min = 3, max = 255)
    private String description;
    


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="user_id")
    private User user;
    
    @OneToMany(mappedBy = "course", fetch = FetchType.LAZY)
    private List <Student> students;

    public Course() {
    }


    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDay() {
        return this.day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public Integer getPrice() {
        return this.price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public String getTime() {
        return this.time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getAmPm() {
        return this.amPm;
    }

    public void setAmPm(String amPm) {
        this.amPm = amPm;
    }

    public String getDescription() {
        return this.description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public User getUser() {
        return this.user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Student> getStudents() {
        return this.students;
    }

    public void setStudents(List<Student> students) {
        this.students = students;
    }


    public LocalDate getDate() {
        return this.date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }


    @Override
    public String toString() {
        return "{" +
            " id='" + getId() + "'" +
            ", name='" + getName() + "'" +
            ", day='" + getDay() + "'" +
            ", price='" + getPrice() + "'" +
            ", time='" + getTime() + "'" +
            ", amPm='" + getAmPm() + "'" +
            ", description='" + getDescription() + "'" +
            ", user='" + getUser() + "'" +
            ", students='" + getStudents() + "'" +
            "}";
    }



}

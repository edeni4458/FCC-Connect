package ema.belt.services;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ema.belt.models.Course;
import ema.belt.repositories.CourseRepository;

@Service
public class CourseService {

    @Autowired CourseRepository courseRepository;

    public void createCourse(@Valid Course course) {
        courseRepository.save(course);
    }

    public List<Course> getAllCourses() {
        return courseRepository.findAll();
    }

    public Course getOneCourse(Long id) {
        Optional<Course> course = courseRepository.findById(id);
        return course.orElse(null);
    }

    public void updateCourse(@Valid Course course) {
        courseRepository.save(course);
    }

    public void destroyClass(Long id) {
        courseRepository.deleteById(id);
    }

    public void createStudent(@Valid Course course) {
        courseRepository.save(course);
    }
}

package ema.belt.services;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ema.belt.models.Student;
import ema.belt.repositories.StudentRepository;

@Service
public class StudentService {
    
    @Autowired StudentRepository studentRepository;

    public List<Student> getAllStudents() {
        return studentRepository.findAll();
    }

    public void createStudent(@Valid Student student) {
        studentRepository.save(student);
    }

    public Student getOneStudent(Long id) {
        Optional<Student> student = studentRepository.findById(id);
        return student.orElse(null);
    }

    public List<Student> getAllStudent(Long id) {
        return null;
    }

    public void updateStudent(@Valid Student student) {
        studentRepository.save(student);
    }

    public void destroyClass(Long id) {
        studentRepository.deleteById(id);
    }
}

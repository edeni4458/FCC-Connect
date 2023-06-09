package ema.belt.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import ema.belt.models.Student;


@Repository

public interface StudentRepository extends CrudRepository<Student, Long> {
    List<Student> findAll();



}
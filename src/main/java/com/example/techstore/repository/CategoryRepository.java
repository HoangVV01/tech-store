package com.example.techstore.repository;

import com.example.techstore.model.Category;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoryRepository extends MongoRepository<Category, String> {
    // MongoRepository provides basic CRUD operations
}

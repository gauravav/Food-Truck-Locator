package com.foodTruck.backend.controller;

import com.foodTruck.backend.objectClasses.*;
import com.foodTruck.backend.util.DBData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.logging.Logger;

@CrossOrigin("http://localhost:3000")
@RestController
public class Controller {

    private final DBData dbData;
    private final Logger logger = Logger.getLogger(Controller.class.getName());

    @Autowired
    public Controller(DBData dbData) {
        this.dbData = dbData;
    }

    @PostMapping("/login")
    public ResponseEntity<AccountDetails> login(@RequestBody AccountDetails test) {
        Optional<AccountDetails> userOpt = dbData.login(test.getUsername(), test.getPassword());
        return userOpt.map(user -> new ResponseEntity<>(user, HttpStatus.OK))
                .orElseGet(() -> {
                    test.setMessage("Invalid username or password");
                    return new ResponseEntity<>(test, HttpStatus.UNAUTHORIZED);
                });
    }

    @PostMapping("/adminLogin")
    public ResponseEntity<AccountDetails> adminLogin(@RequestBody AccountDetails test) {
        if ("admin".equals(test.getUsername()) && "admin123".equals(test.getPassword())) {
            test.setMessage("Admin");
            return new ResponseEntity<>(test, HttpStatus.OK);
        }
        test.setMessage("Invalid admin credentials");
        return new ResponseEntity<>(test, HttpStatus.UNAUTHORIZED);
    }

    @GetMapping("/getAllFoodTrucks")
    public ResponseEntity<List<FoodTruckInformation>> getAllFoodTrucks() {
        return ResponseEntity.ok(dbData.getAllFoodTrucks());
    }

    @PostMapping("/register")
    public ResponseEntity<AccountDetails> register(@RequestBody AccountDetails user) {
        AccountDetails registeredUser = dbData.registerUser(user);
        return ResponseEntity.ok(registeredUser);
    }

    @PostMapping("/createFoodTruck")
    public ResponseEntity<FoodTruckInformation> createFoodTruck(@RequestBody FoodTruckInformation foodTruckInformation) {
        // Optional implementation for DB refactored version
        return ResponseEntity.status(HttpStatus.NOT_IMPLEMENTED).build();
    }

    @PostMapping("/updateAccountDetails")
    public ResponseEntity<AccountDetails> update(@RequestBody AccountDetails user) {
        // Optional implementation for DB refactored version
        return ResponseEntity.status(HttpStatus.NOT_IMPLEMENTED).build();
    }

    @GetMapping("/getUserInfoById/{id}")
    public ResponseEntity<AccountDetails> getUserInfoById(@PathVariable int id) {
        Optional<AccountDetails> userOpt = dbData.getUserInfoById(id);
        return userOpt.map(ResponseEntity::ok)
                .orElseGet(() -> {
                    AccountDetails notFound = new AccountDetails();
                    notFound.setMessage("User not found");
                    return new ResponseEntity<>(notFound, HttpStatus.NOT_FOUND);
                });
    }

    @GetMapping("/getFoodTruckInformationById/{id}")
    public ResponseEntity<FoodTruckInformation> getFoodTruckInformationById(@PathVariable int id) {
        Optional<FoodTruckInformation> infoOpt = dbData.getFoodTruckInformationById(id);
        return infoOpt.map(ResponseEntity::ok)
                .orElseGet(() -> {
                    FoodTruckInformation notFound = new FoodTruckInformation();
                    notFound.setMessage("Food truck not found");
                    return new ResponseEntity<>(notFound, HttpStatus.NOT_FOUND);
                });
    }

    @GetMapping("/getReviewsByFoodTruckId/{id}")
    public ResponseEntity<List<Review>> getReviewsByFoodTruckId(@PathVariable int id) {
        return ResponseEntity.ok(dbData.getReviewsByFoodTruckId(id));
    }

    @PostMapping("/getFoodTrucksByDistance")
    public ResponseEntity<List<FoodTruckInformation>> getFoodTrucksByDistance(@RequestBody Circle input) {
        List<FoodTruckInformation> list = dbData.getFoodTrucksByDistance(input);
        return ResponseEntity.ok(list);
    }

    @PostMapping("/addReview")
    public ResponseEntity<Review> addReview(@RequestBody Review review) {
        return ResponseEntity.ok(dbData.addReview(review));
    }

    @GetMapping("/getFavFoodTrucksByUserId/{id}")
    public ResponseEntity<List<FoodTruckInformation>> getFavFoodTrucksByUserId(@PathVariable int id) {
        return ResponseEntity.ok(dbData.getFavFoodTrucksByUserId(id));
    }

    @GetMapping("/getFavFoodTrucksArrayByUserId/{id}")
    public ResponseEntity<List<Integer>> getFavFoodTrucksArrayByUserId(@PathVariable int id) {
        logger.info("entering facfood truck array");
        return ResponseEntity.ok(dbData.getFavFoodTrucksArrayByUserId(id));
    }

    @PostMapping("/addOrRemoveFavFoodTruck")
    public ResponseEntity<FavoriteFoodTruck> addOrRemoveFavFoodTruck(@RequestBody FavoriteFoodTruck favoriteFoodTruck) {
        return ResponseEntity.ok(dbData.addOrRemoveFavFoodTruck(favoriteFoodTruck));
    }

}
package com.foodTruck.backend.util;

import com.foodTruck.backend.helpers.Helpers;
import com.foodTruck.backend.objectClasses.*;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.logging.Logger;

@Repository
public class DBData {

    private final JdbcTemplate jdbcTemplate;
    private static final Logger logger = Logger.getLogger(DBData.class.getName());

    public DBData(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public Optional<AccountDetails> login(String username, String password) {
        logger.info("Attempting login for user: " + username);
        String sql = "SELECT * FROM AccountDetails WHERE username = ? AND password = ?";
        List<AccountDetails> users = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(AccountDetails.class), username, password);
        if (users.isEmpty()) {
            return Optional.empty();
        } else {
            AccountDetails user = users.get(0);
            user.setMessage("Login successful");
            return Optional.of(user);
        }
    }

    public AccountDetails registerUser(AccountDetails user) {
        String checkEmailSql = "SELECT COUNT(*) FROM AccountDetails WHERE email = ?";
        Integer emailCount = jdbcTemplate.queryForObject(checkEmailSql, Integer.class, user.getEmail());
        if (emailCount != null && emailCount > 0) {
            user.setMessage("Email already exists. Please use a different email");
            return user;
        }

        String checkUsernameSql = "SELECT COUNT(*) FROM AccountDetails WHERE username = ?";
        Integer usernameCount = jdbcTemplate.queryForObject(checkUsernameSql, Integer.class, user.getUsername());
        if (usernameCount != null && usernameCount > 0) {
            user.setMessage("Username already exists. Please choose a different username");
            return user;
        }

        String insertSql = "INSERT INTO AccountDetails (username, password, email, login_type, status, firstname, lastname) VALUES (?, ?, ?, ?, 'active', ?, ?)";
        int result = jdbcTemplate.update(insertSql,
                user.getUsername(),
                user.getPassword(),
                user.getEmail(),
                user.getLogin_type(),
                user.getFirstname(),
                user.getLastname()
        );

        if (result > 0) {
            user.setMessage("Registration successful");
        } else {
            user.setMessage("Registration failed");
        }
        return user;
    }

    public List<FoodTruckInformation> getAllFoodTrucks() {
        String sql = "SELECT * FROM FoodTruckInformation";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(FoodTruckInformation.class));
    }

    public Optional<AccountDetails> getUserInfoById(int id) {
        String sql = "SELECT * FROM AccountDetails WHERE id = ?";
        List<AccountDetails> users = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(AccountDetails.class), id);
        return users.stream().findFirst();
    }

    public Optional<FoodTruckInformation> getFoodTruckInformationById(int id) {
        String sql = "SELECT * FROM FoodTruckInformation WHERE id = ?";
        List<FoodTruckInformation> trucks = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(FoodTruckInformation.class), id);
        return trucks.stream().findFirst();
    }

    public List<Review> getReviewsByFoodTruckId(int foodTruckId) {
        String sql = "SELECT * FROM reviews WHERE foodtruck_id = ?";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Review.class), foodTruckId);
    }

    public Review addReview(Review review) {
        String sql = "INSERT INTO reviews (user_id, foodtruck_id, rating, comment) VALUES (?, ?, ?, ?)";
        int result = jdbcTemplate.update(sql, review.getUser_id(), review.getFoodtruck_id(), review.getRating(), review.getReview());
        if (result > 0) {
            review.setMessage("Review added successfully");
        } else {
            review.setMessage("Failed to add review");
        }
        return review;
    }

    public List<FoodTruckInformation> getFavFoodTrucksByUserId(int userId) {
        String sql = "SELECT * FROM FoodTruckInformation WHERE id IN (SELECT foodtruck_id FROM favfoodtrucks WHERE user_id = ?)";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(FoodTruckInformation.class), userId);
    }

    public List<Integer> getFavFoodTrucksArrayByUserId(int userId) {
        String sql = "SELECT foodtruck_id FROM favfoodtrucks WHERE user_id = ?";
        return jdbcTemplate.queryForList(sql, Integer.class, userId);
    }

    public FavoriteFoodTruck addOrRemoveFavFoodTruck(FavoriteFoodTruck fav) {
        String checkSql = "SELECT COUNT(*) FROM favfoodtrucks WHERE user_id = ? AND foodtruck_id = ?";
        Integer count = jdbcTemplate.queryForObject(checkSql, Integer.class, fav.getUser_id(), fav.getFoodtruck_id());

        if (count != null && count > 0) {
            String deleteSql = "DELETE FROM favfoodtrucks WHERE user_id = ? AND foodtruck_id = ?";
            int result = jdbcTemplate.update(deleteSql, fav.getUser_id(), fav.getFoodtruck_id());
            fav.setMessage(result > 0 ? "Removed from favorites" : "Failed to remove from favorites");
        } else {
            String insertSql = "INSERT INTO favfoodtrucks (user_id, foodtruck_id) VALUES (?, ?)";
            int result = jdbcTemplate.update(insertSql, fav.getUser_id(), fav.getFoodtruck_id());
            fav.setMessage(result > 0 ? "Added to favorites" : "Failed to add to favorites");
        }
        return fav;
    }


    public List<FoodTruckInformation> getFoodTrucksByDistance(Circle input) {
        logger.info("Inside getFoodTrucksByDistance");
        logger.info(input.toString());

        String sql = "SELECT * FROM FoodTruckInformation";
        List<FoodTruckInformation> allTrucks = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(FoodTruckInformation.class));

        return allTrucks.stream()
                .filter(truck -> {
                    double dist = Helpers.distance(
                            input.getLatitude(),
                            input.getLongitude(),
                            truck.getLatitude(),
                            truck.getLongitude()
                    );
                    logger.info("Food Truck " + truck.getName() + " is at distance: " + dist);
                    return dist <= input.getDistance();
                })
                .toList();
    }

}

package com.tourism.service;

import com.tourism.model.User;
import java.io.*;
import java.nio.file.*;
import java.util.*;
import java.util.Random;

public class UserService {
    private static final String USER_FILE = "C:\\Users\\Dell\\Pictures\\sllit or doc\\Thiloo\\Tourism\\src\\main\\webapp\\assets\\Database\\users.txt";

    // Map to store email -> OTP mappings
    private static final Map<String, String> otpMap = new HashMap<>();

    public UserService() {
    }

    public boolean registerUser(User user) {
        // Check if user already exists
        if (getUserByEmail(user.getEmail()) != null) {
            return false;
        }

        try (FileWriter fw = new FileWriter(USER_FILE, true);
             BufferedWriter bw = new BufferedWriter(fw);
             PrintWriter out = new PrintWriter(bw)) {
            out.println(user.toString());
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }

    public User getUserByEmail(String email) {
        System.out.println("getUserByEmail - Looking for email: " + email);
        try {
            File file = new File(USER_FILE);
            if (!file.exists()) {
                System.out.println("User file does not exist: " + USER_FILE);
                return null;
            }

            System.out.println("Reading user file: " + USER_FILE);
            List<String> lines = Files.readAllLines(file.toPath());
            System.out.println("Number of users in file: " + lines.size());

            for (String line : lines) {
                String[] parts = line.split(",");
                System.out.println("Checking user: " + parts[2] + " (comparing with " + email + ")");

                if (parts.length >= 5 && parts[2].equalsIgnoreCase(email)) {
                    System.out.println("User found! Creating user object...");
                    User user = new User();
                    user.setFirstName(parts[0]);
                    user.setLastName(parts[1]);
                    user.setEmail(parts[2]);
                    user.setPhone(parts[3]);
                    user.setPassword(parts[4]);

                    // Load additional fields if they exist
                    if (parts.length > 5 && !parts[5].isEmpty()) {
                        user.setDob(parts[5]);
                    }

                    if (parts.length > 6 && !parts[6].isEmpty()) {
                        user.setAddress(parts[6]);
                    }

                    if (parts.length > 7 && !parts[7].isEmpty()) {
                        user.setTravelPreference(parts[7]);
                    }

                    return user;
                }
            }
            System.out.println("User not found with email: " + email);
        } catch (IOException e) {
            System.out.println("Error reading user file: " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }

    public User loginUser(String email, String password) {
        System.out.println("UserService.loginUser - Email: " + email);

        User user = getUserByEmail(email);
        System.out.println("User found: " + (user != null ? "Yes" : "No"));

        if (user != null) {
            System.out.println("Stored password: " + user.getPassword());
            System.out.println("Password match: " + (user.getPassword().equals(password) ? "Yes" : "No"));

            if (user.getPassword().equals(password)) {
                return user;
            }
        }
        return null;
    }

    public boolean updateUser(User updatedUser) {
        try {
            File file = new File(USER_FILE);
            if (!file.exists()) {
                return false;
            }

            List<String> lines = Files.readAllLines(file.toPath());
            List<String> updatedLines = new ArrayList<>();
            boolean userFound = false;

            for (String line : lines) {
                String[] parts = line.split(",");
                if (parts.length >= 5 && parts[2].equals(updatedUser.getEmail())) {
                    // Found the user to update
                    updatedLines.add(updatedUser.toString());
                    userFound = true;
                } else {
                    updatedLines.add(line);
                }
            }

            if (!userFound) {
                return false;
            }

            // Write the updated content back to the file
            Files.write(file.toPath(), updatedLines);
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteUser(String email) {
        try {
            File file = new File(USER_FILE);
            if (!file.exists()) {
                return false;
            }

            List<String> lines = Files.readAllLines(file.toPath());
            List<String> updatedLines = new ArrayList<>();
            boolean userFound = false;

            for (String line : lines) {
                String[] parts = line.split(",");
                if (parts.length >= 5 && parts[2].equals(email)) {
                    // Skip this user (effectively deleting it)
                    userFound = true;
                } else {
                    updatedLines.add(line);
                }
            }

            if (!userFound) {
                return false;
            }

            // Write the updated content back to the file
            Files.write(file.toPath(), updatedLines);
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Generate a random 6-digit OTP
    public String generateOTP(String email) {
        // Check if user exists
        if (getUserByEmail(email) == null) {
            return null;
        }

        // Generate a random 6-digit OTP
        Random random = new Random();
        String otp = String.format("%06d", random.nextInt(1000000));

        // Store the OTP
        otpMap.put(email, otp);

        // Print OTP to console (in a real app, this would be sent via email)
        System.out.println("OTP for " + email + ": " + otp);

        return otp;
    }

    // Validate OTP
    public boolean validateOTP(String email, String otp) {
        // Check if OTP exists for this email
        if (!otpMap.containsKey(email)) {
            return false;
        }

        // Check if OTP matches
        boolean isValid = otpMap.get(email).equals(otp);

        // Remove OTP after validation (one-time use)
        if (isValid) {
            otpMap.remove(email);
        }

        return isValid;
    }

    // Reset password
    public boolean resetPassword(String email, String newPassword) {
        try {
            File file = new File(USER_FILE);
            if (!file.exists()) {
                return false;
            }

            List<String> lines = Files.readAllLines(file.toPath());
            List<String> updatedLines = new ArrayList<>();
            boolean userFound = false;

            for (String line : lines) {
                String[] parts = line.split(",");
                if (parts.length >= 5 && parts[2].equals(email)) {
                    // Update password
                    User user = new User();
                    user.setFirstName(parts[0]);
                    user.setLastName(parts[1]);
                    user.setEmail(parts[2]);
                    user.setPhone(parts[3]);
                    user.setPassword(newPassword);

                    // Preserve additional fields if they exist
                    if (parts.length > 5 && !parts[5].isEmpty()) {
                        user.setDob(parts[5]);
                    }

                    if (parts.length > 6 && !parts[6].isEmpty()) {
                        user.setAddress(parts[6]);
                    }

                    if (parts.length > 7 && !parts[7].isEmpty()) {
                        user.setTravelPreference(parts[7]);
                    }

                    updatedLines.add(user.toString());
                    userFound = true;
                } else {
                    updatedLines.add(line);
                }
            }

            if (!userFound) {
                return false;
            }

            // Write the updated content back to the file
            Files.write(file.toPath(), updatedLines);
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }
}


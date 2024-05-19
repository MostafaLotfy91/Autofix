
package Entities;

import java.security.Timestamp;

public class Customer {
    
    private int customerId ;
    private String firstName;
    private String lastName;
    private String email;
    private String password;
    private String carModel;
    private Timestamp createdAt;


    public int getId() {
        return customerId;
    }

    public void setId(int id) {
        this.customerId = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCarModel() {
        return carModel;
    }

    public void setCarModel(String carModel) {
        this.carModel = carModel;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    @Override
    public String toString() {
        return "Customer{" + "id=" + customerId + ", firstName=" + firstName + ", lastName=" + lastName + ", email=" + email + ", password=" + password + ", carModel=" + carModel + ", createdAt=" + createdAt + '}';
    }
    
    
}

# 🏥 Smart Hospital Appointment System

A full-stack web application built with **Java Servlets + JSP** (backend) and stunning modern CSS UI (frontend), connected to a **Cloud MySQL** database.

---

## 🚀 Tech Stack

| Layer | Technology |
|-------|-----------|
| Frontend | HTML5, CSS3, JavaScript (Vanilla) |
| Backend | Java 17, Servlets, JSP |
| Build Tool | Apache Maven |
| Server | Apache Tomcat 10.x |
| Database | MySQL (Local / Cloud: PlanetScale / AWS RDS / Google Cloud SQL) |
| Styling | Custom CSS3 with Glassmorphism, Gradients, Animations |
| Icons | Font Awesome 6 |
| Fonts | Google Fonts (Inter) |

---

## 📁 Project Structure

```
hospittal/
├── pom.xml                          # Maven build config
├── sql/
│   └── schema.sql                   # Database schema + sample data
└── src/main/
    ├── java/com/hospital/
    │   ├── dao/
    │   │   ├── PatientDAO.java
    │   │   ├── HospitalDAO.java
    │   │   └── AppointmentDAO.java
    │   ├── model/
    │   │   ├── Patient.java
    │   │   ├── Hospital.java
    │   │   └── Appointment.java
    │   ├── servlet/
    │   │   ├── PatientRegisterServlet.java
    │   │   ├── PatientLoginServlet.java
    │   │   ├── PatientDashboardServlet.java
    │   │   ├── HospitalRegisterServlet.java
    │   │   ├── HospitalLoginServlet.java
    │   │   ├── HospitalDashboardServlet.java
    │   │   ├── HospitalSearchServlet.java
    │   │   ├── BookAppointmentServlet.java
    │   │   ├── AppointmentActionServlet.java
    │   │   └── LogoutServlet.java
    │   └── util/
    │       └── DBConnection.java
    └── webapp/
        ├── WEB-INF/web.xml
        ├── index.jsp                # Home page (landing)
        ├── patient-login.jsp
        ├── patient-register.jsp
        ├── patient-dashboard.jsp
        ├── hospital-login.jsp
        ├── hospital-register.jsp
        ├── hospital-dashboard.jsp
        ├── hospital-search.jsp
        ├── book-appointment.jsp
        └── booking-success.jsp
```

---

## ⚙️ Setup & Deployment

### Step 1: Database Setup

**Local MySQL:**
```sql
-- Run the schema file
mysql -u root -p < sql/schema.sql
```

**Cloud MySQL (PlanetScale / AWS RDS):**
1. Create a database named `hospital_db`
2. Run `sql/schema.sql` in the cloud console
3. Note your connection string:
   - PlanetScale: `jdbc:mysql://aws.connect.psdb.cloud:3306/hospital_db?useSSL=true`
   - AWS RDS: `jdbc:mysql://<endpoint>.rds.amazonaws.com:3306/hospital_db`

### Step 2: Configure Database Connection

Edit `src/main/java/com/hospital/util/DBConnection.java`:

```java
private static final String DB_URL  = "jdbc:mysql://YOUR_HOST:3306/hospital_db?useSSL=false&serverTimezone=UTC";
private static final String DB_USER = "YOUR_USERNAME";
private static final String DB_PASS = "YOUR_PASSWORD";
```

### Step 3: Build the Project

```bash
# Navigate to project root
cd "c:\Users\aravi\OneDrive\Desktop\New folder\hospittal"

# Build WAR file
mvn clean package

# WAR file will be at: target/hospital-system.war
```

### Step 4: Deploy to Tomcat

1. Download **Apache Tomcat 10.x** from https://tomcat.apache.org/
2. Copy `target/hospital-system.war` to `<TOMCAT_HOME>/webapps/`
3. Start Tomcat: `<TOMCAT_HOME>/bin/startup.bat`
4. Open: `http://localhost:8080/hospital-system/`

---

## 🎯 User Flow

### Patient Flow:
1. 🏠 Home → Patient Login / Register
2. 📋 Register (fill health details)
3. 🔍 Search hospitals by name/location
4. 📅 Select hospital → Book appointment (date + time slot)
5. ✅ Booking submitted (Pending status)
6. 📊 Dashboard → View status + token number

### Hospital Flow:
1. 🏠 Home → Hospital Login / Register
2. 📊 Dashboard → View all patient requests
3. 👀 See patient medical info (BP, Sugar, History)
4. ✅ Accept → Auto token generated
5. ❌ Reject → Status updated

---

## 💡 Features

- ✅ **Multi-step patient registration** with health data (BP, Sugar, Medical History)
- ✅ **Animated glassmorphism UI** with gradient backgrounds
- ✅ **Hospital search** by name or location
- ✅ **Time slot booking** (Morning / Afternoon / Evening)
- ✅ **Auto token generation** — incremental per hospital per day
- ✅ **Status tracking** — Pending (🟡) / Confirmed (🟢) / Rejected (🔴)
- ✅ **Session management** with 30-min timeout
- ✅ **Dashboard filters** for hospital (All/Pending/Confirmed/Rejected)
- ✅ **Confetti animation** on successful booking
- ✅ **Responsive mobile design**
- ✅ **Flash messages** with auto-dismiss
- ✅ **DAO pattern** for clean code architecture

---

## 🔐 Sample Login Credentials

After running `schema.sql`, these sample hospitals are available:

| Hospital | Email | Password |
|---------|-------|---------|
| Apollo Hospitals | apollo@hospital.com | Apollo@123 |
| Fortis Healthcare | fortis@hospital.com | Fortis@123 |
| AIIMS Delhi | aiims@hospital.com | Aiims@123 |
| Manipal Hospital | manipal@hospital.com | Manipal@123 |

---

## 🔧 Requirements

- JDK 17+
- Maven 3.8+
- Apache Tomcat 10.x (for Jakarta EE 9+)
- MySQL 8.0+

> ⚠️ **Note:** This project uses **Jakarta EE** (`jakarta.servlet.*`), compatible with **Tomcat 10+** only.  
> For Tomcat 9.x, change imports to `javax.servlet.*` and update the `pom.xml` dependencies to `javax.servlet-api:4.0.1`.

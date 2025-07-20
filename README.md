# TaxMate - Financial & Tax Services Platform

A comprehensive mobile application connecting clients with financial service providers including Chartered Accountants, Bank Loan Officers, and Financial Planners.

## 🎯 Overview

TaxMate is a full-stack mobile application that facilitates financial service delivery through a modern, user-friendly platform. The app enables seamless communication between clients and financial professionals while providing advanced features like AI-powered financial chatbot, loan management, and financial data analysis.

## ✨ Features

### For Clients
- **Service Provider Discovery**: Find and connect with Chartered Accountants, Bank Loan Officers, and Financial Planners
- **Real-time Messaging**: Direct communication with approved service providers
- **Loan Application Management**: Submit and track loan applications with real-time status updates
- **Financial Data Management**: Input and manage comprehensive financial information
- **AI Financial Assistant**: Get personalized financial advice through an intelligent chatbot
- **Document Upload**: Secure file sharing with service providers
- **Financial Reports**: Generate detailed financial summaries and analysis

### For Service Providers
- **Client Management**: View and manage client requests and approvals
- **Professional Dashboard**: Dedicated interfaces for CAs, BLOs, and FPs
- **Real-time Communication**: Chat system for client interaction
- **Loan Processing**: Handle loan applications and update statuses
- **Document Access**: Review client-uploaded documents
- **Performance Analytics**: Track service delivery metrics

### For Administrators
- **User Approval System**: Review and approve service provider registrations
- **Platform Monitoring**: Oversee all user activities and system health
- **Content Management**: Manage platform policies and guidelines

## 🏗️ Architecture

### Backend (FastAPI + PostgreSQL)
- **Framework**: FastAPI 0.115.12
- **Database**: PostgreSQL with SQLAlchemy ORM
- **Authentication**: JWT-based with bcrypt password hashing
- **Real-time Communication**: WebSocket support for chat
- **AI/ML**: SpaCy and NLTK for natural language processing
- **Cloud Storage**: Supabase integration
- **Push Notifications**: Firebase Cloud Messaging
- **Email Services**: Integrated email system for notifications

### Frontend (Flutter)
- **Framework**: Flutter (Dart)
- **State Management**: StatefulWidget with secure storage
- **Authentication**: Secure token-based authentication
- **Real-time Features**: WebSocket integration for chat
- **Push Notifications**: Firebase integration
- **File Management**: Document upload and download capabilities
- **Cross-platform**: Android and iOS support

### Cloud Infrastructure
- **Hosting**: Render.com (Web Service)
- **Database**: Render PostgreSQL
- **CDN**: Firebase for real-time features
- **Storage**: Supabase for file management

## 🚀 Live Demo

- **Backend API**: [https://taxmate-project.onrender.com](https://taxmate-project.onrender.com)
- **Mobile App**: Download the latest APK from releases

## 📱 Installation & Setup

### Prerequisites
- Flutter SDK (3.0+)
- Python 3.10+
- PostgreSQL
- Firebase account
- Supabase account

### Backend Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/RobBunny/Taxmate_Project.git
   cd Taxmate_Project/backend_server
   ```

2. **Install dependencies**
   ```bash
   pip install -r requirements.txt
   ```

3. **Setup environment variables**
   ```bash
   # Create .env file
   DATABASE_URL=your_postgresql_connection_string
   SUPABASE_URL=your_supabase_url
   SUPABASE_KEY=your_supabase_key
   EMAIL_HOST=your_email_host
   EMAIL_PORT=587
   EMAIL_USERNAME=your_email
   EMAIL_PASSWORD=your_password
   ```

4. **Initialize NLTK data**
   ```bash
   python setup_nltk.py
   ```

5. **Run the server**
   ```bash
   uvicorn main:app --host 0.0.0.0 --port 8000 --reload
   ```

### Frontend Setup

1. **Navigate to Flutter directory**
   ```bash
   cd ../flutter_server
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Firebase**
   - Add your `google-services.json` (Android) and `GoogleService-Info.plist` (iOS)
   - Update Firebase configuration in the code

4. **Run the app**
   ```bash
   flutter run
   ```

### Database Setup

1. **Create PostgreSQL database**
   ```sql
   CREATE DATABASE flutter_auth_db;
   ```

2. **Import schema and data**
   ```bash
   psql -d flutter_auth_db -f backend_server/flutter_auth_db.sql
   ```

## 🔧 Configuration

### Backend Configuration
- **Database**: Update `DATABASE_URL` in environment variables
- **CORS**: Configured for cross-origin requests
- **Security**: JWT tokens with secure password hashing
- **File Upload**: Configurable file size limits and types

### Frontend Configuration
- **API Base URL**: Update in `lib/main.dart`
- **WebSocket URL**: Update in `lib/chat_page.dart`
- **Firebase**: Configure in `firebase_options.dart`

## 📊 Database Schema

The application uses PostgreSQL with the following main tables:

- **users**: User accounts (clients, service providers, admins)
- **service_requests**: Connection requests between clients and providers
- **messages**: Real-time chat messages
- **loan_requests**: Loan application data
- **loan_status**: Loan processing status tracking
- **financial_data**: Client financial information
- **password_reset_tokens**: Secure password reset functionality

## 🤖 AI Features

### Financial Chatbot
- **Technology**: Advanced NLP using SpaCy and NLTK
- **Capabilities**: 
  - Personalized financial advice
  - Budget analysis and recommendations
  - Investment guidance
  - Tax planning suggestions
- **Data Sources**: Client financial data integration
- **Learning**: Continuous improvement through user interactions

## 🔐 Security Features

- **Authentication**: JWT-based with secure token management
- **Password Security**: bcrypt hashing with salt
- **Data Encryption**: End-to-end encryption for sensitive data
- **Input Validation**: Comprehensive validation on all endpoints
- **CORS Protection**: Configured cross-origin resource sharing
- **SQL Injection Protection**: ORM-based database queries

## 📈 Performance Optimizations

- **Database Indexing**: Optimized queries with proper indexing
- **Caching**: Redis integration for session management
- **Image Optimization**: Compressed image handling
- **Lazy Loading**: Efficient data loading in mobile app
- **Connection Pooling**: Database connection optimization

## 🚀 Deployment

### Production Deployment (Render)

1. **Database**: PostgreSQL on Render
2. **Backend**: Web Service on Render
3. **Environment Variables**: Set in Render dashboard
4. **Domain**: Custom domain configuration available

### Mobile App Distribution

1. **Android**: APK generation for direct distribution
2. **Google Play Store**: Production-ready for store submission
3. **iOS**: App Store deployment ready

## 🧪 Testing

### Backend Testing
```bash
# Run API tests
pytest tests/

# Test specific endpoints
python test_chatbot.py
```

### Frontend Testing
```bash
# Run Flutter tests
flutter test

# Integration tests
flutter drive --target=test_driver/app.dart
```

## 📝 API Documentation

### Authentication Endpoints
- `POST /signup/` - User registration
- `POST /login/` - User authentication
- `POST /reset-password/` - Password reset

### Service Provider Endpoints
- `GET /chartered_accountants/` - List CAs
- `GET /bank_loan_officers/` - List BLOs
- `GET /financial_planners/` - List FPs

### Communication Endpoints
- `WS /ws/chat/{user_id}` - WebSocket chat
- `GET /client/{client_id}/requests` - Get client requests

### Financial Services
- `POST /financial-data/{client_id}` - Save financial data
- `GET /financial-summary/{client_id}` - Generate financial summary
- `POST /chatbot` - AI financial assistant

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👥 Team

- **Lead Developer**: Ahnaf
- **Backend Developer**: Sakafy  
- **Frontend Developer**: Rabbani
- **UI/UX Designer**: Arafat

## 📞 Support

For support and inquiries:
- **Email**: farhanbinrabbani@gmail.com
- **Documentation**: [docs.taxmate.com](https://docs.taxmate.com)
- **Issues**: [GitHub Issues](https://github.com/RobBunny/Taxmate_Project/issues)

## 📱 Download App

**Android APK**: [Download TaxMate v1.0.0 (27.5MB)](https://drive.google.com/file/d/1tiSS2U_tFBH8TLQN5XsPTfgsvG2Xn_Gj/view?usp=drive_link)

### Installation Steps
1. Click the download link above
2. Enable "Install from unknown sources" in Android Settings > Security
3. Install the APK file
4. Launch TaxMate and enjoy the full-featured financial platform!

## 🔄 Version History

### v1.0.0 (Current)
- Initial release
- Complete user management system
- Real-time chat functionality
- AI-powered financial chatbot
- Loan application system
- Financial data management
- Admin approval system
- Cloud deployment ready

## 🚗 Roadmap

### Upcoming Features
- [ ] Multi-language support
- [ ] Advanced financial analytics
- [ ] Mobile banking integration
- [ ] Document verification system
- [ ] Video consultation feature
- [ ] Advanced reporting dashboard
- [ ] API rate limiting
- [ ] Enhanced security features

---

**Built with ❤️ using Flutter and FastAPI**

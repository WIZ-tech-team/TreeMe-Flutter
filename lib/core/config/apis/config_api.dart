class API {
  static const baseUrl = 'http://192.168.88.107/api';

  static const register = '/userRegister';
  static const login = '/userlogin';
  static const verifyOtp = '/otp/login';
  static const brands = '/brands';
  static const shift = '/shift';
  static const baseUrlStrip = 'https://api.stripe.com/v1/';
  static const createCustomer = 'customers';
  static const createPaymentMethod = 'payment_methods';
  static const updateCustomer = 'customers/';
  static const attachPaymentMethod = 'attach';
  static const address = '/address';
  static const myShifts = '/my-shifts?status=';
  static const setStripeCustomerID = '/me/stripe-customer-id';
}

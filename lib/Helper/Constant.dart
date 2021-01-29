

final String appName = 'eShop';

final String packageName = 'com.wrteam.eshop';
final String androidLink='https://play.google.com/store/apps/details?id=';

final String iosPackage = 'com.wrteam.eshop';
final String iosLink = 'your ios link here';
final String appStoreId = 'your appp store id here';


final String deepLinkUrlPrefix = 'https://eshopwrteamin.page.link';
final String deepLinkName= 'eshop';



final String baseUrl = 'http://eshop.wrteam.in/app/v1/api/';


final int timeOut = 50;
const int perPage =10;
final String jwtKey = "68f05dec6014f68e760c5c5fa3e31bcf391a2e10";

//label title and message that shown in app

/*
final String somethingMSg = 'Something went wrong. Please try again after some time';
final String profileCom = 'Please complete your profile to place the order';


final String category='Categories';
final String seeAll='See All';

const String RATE_US='Rate Us';
const String SHARE_APP='Share';
const String PRIVACY='Privacy Policy';
const String TERM='Term & Conditions';
const String FAQS='Faqs';
const String  ABOUT_LBL='About Us';
const String LOGOUT='Logout';
const String ALL_CAT='All Categories';
const String ADD_CART= 'ADD TO CART';
const String CART='Cart';
const String FILTER='Filter By';
const String SORT_BY='Sort By';
const String TOP_RATED='Top Rated';

const String F_NEWEST='Newest First';
const String F_OLDEST='Oldest First';
const String F_LOW='Price - Low to High';
const String F_HIGH='Price - High to Low';
const String PROCEED_CHECKOUT='Checkout';
const String ORIGINAL_PRICE='Original Price';
const String OFFER_PRICE='Offer Price';
const String TOTAL_PRICE='Total Price';
const String DELIVERY_CHARGE='Delivery Charge';
const String HOME_LBL='Home';
const String FAVORITE='Favorite';
const String NOTIFICATION='Notifications';
const String TRACK_ORDER='Track Order';
const String TAXPER='Tax';
const String SETTING='Settings';
const String SUB='Sub Total';
const String CHOOSE_LOCATION='Choose Location';
const String BUYNOW='BUY NOW';
const String SPECIFICATION='Specifications';
const String DISCOUPON='Discounts & Coupons';
const String COMINGSOON='Coming soon..';

const String TITLE1_LBL='Search Items';
const String TITLE2_LBL='Order it';
const String TITLE3_LBL='You Got it';
const String DISCRIPTION1='Search millions of items you want very easily';
const String DISCRIPTION2="We're the eShop and here to make your life easier. Just relax and let's get started";
const String DISCRIPTION3='Special for you. Free delivered fees for many cities.';
const String GET_STARTED='Get Started';
const String WELCOME_ESHOP='Welcome to eShop';
const String ECOMMERCE_APP_FOR_ALL_BUSINESS='The eCommerce app for all business';
const String FORGOT_PASSWORD_LBL='Forgot Password?';
const String LOGIN_LBL='Login';
const String DONT_HAVE_AN_ACC="Don't have an account? ";
const String SIGN_UP_LBL='Sign Up';
const String USER_REGISTRATION_DETAILS='User Details';
const String SHOW_PASSWORD='Show Password';
const String VERIFY_MOBILE_NUMBER='Verify Mobile Number';
const String ALREADY_A_CUSTOMER='Already a customer? ';
const String LOG_IN_LBL='Log In';
const String MOBILE_NUMBER_VARIFICATION='Enter Verification Code';
const String MOBILEHINT_LBL='Mobile number';
const String PASSHINT_LBL='Password';
const String NAMEHINT_LBL='User name';
const String EMAILHINT_LBL='Email';
const String CONFIRMPASSHINT_LBL='Confirm Password';
const String PINCODEHINT_LBL='Pincode';
const String CITYSELECT_LBL='Select City';
const String AREASELECT_LBL='Select Area';
const String DOB_LBL='Date of Birth';
const String GALLARY_LBL="Gallary";
const String COUNTRY_CODE_LBL="Select country code";
const String TOTAL_LBL='Total';


const String noItem='No Item Found..!!';
const String noFav='No Favorite Found..!!';
const String noNoti='No Notification Found..!!';
const String goToLogin='Please login to access favorite..!!';
const String searchHint='Search for desired products here';
const String selectVarient='Select Variant';
const String addressWarning='Please Select Address..!!';
const String dateWarning='Please Select Delivery Date..!!';
const String timeWarning='Please Select Delivery Time..!!';
const String payWarning='Please Select Payment Method..!!';
const String cityWarning='City is Required';
const String areaWarning='Area is Required';
const String locationWarning='Please Select Location From Map';
const String emailWarning='Email is Required';
const String phoneWarning='Contact is Required';


const String SKIP='Skip';
const String VERIFY_AND_PROCEED='Verify and proceed';
const String DIDNT_GET_THE_CODE="Didn't get the code? ";
const String RESEND_OTP='Resend OTP';
const String SEND_OTP='Send OTP';
const String FORGOT_PASSWORDTITILE='Forgot Password';
const String GET_PASSWORD='Get Password';
const String NEXT_LBL='Next';
const String SET_PASSWORD='Set Password';
const String UPDATE_PROFILE_LBL='Update Profile';
const String LOGOUTTXT='Are you sure you want to logout?';
const String LOGOUTYES='Yes';
const String LOGOUTNO='No';
const String CHECKOUT='Checkout';
const String DELIVERY='Delivery';
const String ADDRESS_LBL='Address';
const String PAYMENT='Payment';
const String APPLY='Apply';
const String PROMOCODE_LBL='Have a Promo Code?';
const String ORDER_SUMMARY='Order Summary';
const String PRODUCTNAME='Product Name';
const String PRICE_LBL='Price';
const String SUBTOTAL='Sub total';
const String QUANTITY_LBL='Qty';
const String ADDADDRESS='Add New Address';
const String CONTINUE='Continue';
const String NAME_LBL='Name';
const String ALT_MOB='Alternate Mobile Number';
const String LANDMARK_LBL='Landmark';
const String STATE_LBL='State';
const String COUNTRY_LBL='Country';
const String OTHER_LBL='Other';
const String OFFICE_LBL='Office';
const String DEFAULT_ADD='Set as a default address';
const String NOADDRESS='No Address Found..!!';
const String UPDATEADD='Update Address';
const String PREFERED_TIME='Preferred Delivery Date/Time';
const String PAYMENT_METHOD_LBL='Payment Method';
const String COD_LBL='Cash On Delivery';
const String PAYPAL_LBL='PayPal';
const String PAYUMONEY_LBL='PayUMoney';
const String RAZORPAY_LBL='RazorPay';
const String PAYSTACK_LBL='Paystack';
const String FLUTTERWAVE_LBL='Flutterwave';
const String PROCEED='Proceed';
const String PLACE_ORDER='Place Order';
const String MORE_PRODUCT='More Product';
const String GUEST='Hello,\nguest';

//const String TOTAL="Total";
const String CONFIRM_ORDER='Confirm Order';
const String CONFIRM='Confirm';
const String CANCEL='Cancel';
const String ORDER_PLACED='Order Placed';
const String ORD_PLC='Thank You';
const String ORD_PLC_SUCC='Your order has been placed successfully!';
const String ADD_PROMO='Please Add Promo Code';
const String PROMO_LBL='Promo Code';
const String PROMO_SUCCESS='Promo code applied successfully';
const String USE_WALLET='Use Wallet Balance';
const String TOTAL_BAL='Total Balance';
const String REMAIN_BAL='Remaining Balance';
const String ORDER_ID_LBL='Order ID';
const String ORDER_DATE='Order Date';
const String ORDER_OTP="Order OTP";
const String ORDER_PROCESSED='Order Proccessed';
const String ORDER_SHIPPED='Order Shipped';
const String ORDER_DELIVERED='Order Delivered';
const String ORDER_NPLACED='Order Placed';
const String ORDER_CANCLED='Order Cancelled';
const String ORDER_RETURNED='Order Returned';
const String ORDER_DETAIL='Order Details';
const String PRICE_DETAIL='Price Detail';
const String WALLET_BAL='Wallet Balance';
const String SHIPPING_DETAIL='Shipping Details';
const String MOB_LBL='Mobile';
const String ORDER_STATUS='Order Status';
const String PROMO_CODE_DIS_LBL='Promo Code Discount';
const String CANCEL_ORDER='Cancel Order';
const String RETURN_ORDER='Return Order';
const String ORDER_CNCLE_SUCC='Order Cancled Successfully..!!';
const String SELECT_PAYMENT='Select Payment Method';

const String NO_CART='Your Cart Is Empty';
const String CART_DESC="Looking like you haven't added anything to your cart yet";

const String NO_INTERNET="No Internet";
const String NO_INTERNET_DISC="Please check your connection again, or connect to Wi-Fi";
const String TRY_AGAIN_INT_LBL="Try Again";
const String SHOP_NOW='Shop Now';
const String OUT_OF_STOCK_LBL="Out Of Stock";
const String SIGNIN_ACC_LBL="Sign in to your account";
const String SIGNIN_LBL="Sign in";
const String CREATE_ACC_LBL="Create an account";
const String SKIP_SIGNIN_LBL="Skip sign in";
const String CONTINUE_AGREE_LBL="By continuing, you agree to our";
const String TERMS_SERVICE_LBL="Terms of Service";
const String AND_LBL="and";
const String PRIVACY_POLICY_LBL="Privacy Policy";
const String SEND_VERIFY_CODE_LBL="We will send a Verification Code to This Number";
const String SENT_VERIFY_CODE_TO_NO_LBL="We have sent a verification code to";
const String SEND_OTP_TITLE="send otp";
const String FORGOT_PASS_TITLE="forgot pass";
const String MORE_DETAIL="More Details";
const String CONTINUE_SHOPPING='Continue Shopping';
const String DELIVERED_LBL='Delivered';
const String FIRSTSIGNUP_MSG="Please first Sign Up! Your mobile number is not register";
const String REGISTER_SUCCESS_MSG="User Registered Successfully";
const String PASS_SUCCESS_MSG="Password Update Successfully! Please Login";
const String CON_PASS_REQUIRED_MSG="Confirm Password is Required";
const String CON_PASS_NOT_MATCH_MSG="Confirm Password not match";
const String NEW_OTP_REQ_MSG="Request new OTP after 60 seconds";
const String OTP_VERIFIED_MSG="OTP verified successfully";
const String OTP_ERROR_MSG="Error validating OTP, try again";
const String TRY_AGAIN_MSG="Try again after sometime";
const String WRONG_OTP_MSG="Something went wrong";
const String ENTER_OTP_MSG="Please Enter OTP!";
const String PROFILE_UPDATE_MSG="Profile Picture updated successfully";
const String USER_UPDATE_MSG="User Update Successfully";
const String SAVEFORLATER_BTN="Save for later";
const String SET_DEFAULT='Set as Default';
const String DEFAULT_LBL='Default';


const String MOVE_TO_CART='Move to Cart';
const String EDIT_PROFILE_LBL="Edit Profile";
const String LOGIN_REGISTER_LBL="Login/Register";
const String MY_ORDERS_LBL="My Orders";
const String MANAGE_ADD_LBL="Manage Address";
const String CUSTOMER_SUPPORT_LBL="Customer Supported";
const String CHANGE_PASS_LBL="Change Password";
const String CHANGE_LANGUAUE_LBL="Change Language";
const String CHANGE_THEME_LBL="Change Theme";
const String CUR_PASS_LBL="Current Password";
const String CHOOSE_THEME_LBL="Choose Theme";
const String CHOOSE_LANGUAGE_LB="Choose Language";
const String NEW_PASS_LBL="New Password";
const String SAVE_LBL="Save";
const String CUR_PASS_ERROR_MSG="Current Password not match";
const String ADD_NAME_LBL="Add Name";
const String ADD_EMAIL_LBL="Add Email Address";
const String ADD_LOCATION_LBL="Add Location";
const String CUSTOMER_REVIEW_LBL='Customer Reviews';
const String VIEW_ALL='View All';

const String CITY_LBL="City";
const String AREA_LBL="Area";
const String ADD_CITY_LBL="Add City";
const String ADD_AREA_LBL="Add Area";

const String FILTER_CLEAR_LBL="Clear Filters";
const String PRODUCTS_FOUND_LBL="products found";
const String LOCATION_LBL="Location";
const String FIND_ORDER_ITEMS_LBL="Find order items here...";
const String ADD_ITEM='Please add Item to Cart..!!';
const String CHANGE='Change';
const String SHIPP_ADDRESS='Shipping Address';
const String EDIT='EDIT';
const String WRITE_REVIEW_LBL="Write Review";
const String REVIEW_HINT_LBL="Write your review here...";
const String DWNLD_INVOICE='Download Invoice';
const String VIEW='View';
const String INVOICE_PATH='Check Your Download Folder - ';
const String OK_LBL='Ok';
const String SYSTEM_DEFAULT="System default";
const String LIGHT_THEME="Light";
const String DARK_THEME="Dark";
const String ENGLISH_LAN="English";
const String CHINESE_LAN="Chinese";
const String SPANISH_LAN="Spanish";
const String HINDI_LAN="Hindi";
const String ARABIC_LAN="Arabic";
const String RUSSIAN_LAN="Russian";
const String JAPANISE_LAN="Japanise";
const String GERMAN_LAN="German";
const String IOSLBL='iOS:';
const String APPFIND='You can find our app from below url\n\nAndroid:\n';
const String SUBMIT_LBL='SUBMIT';
const String REVIEW_W='Please Fill Details';
const String EXIT_WR='Double tap back button to exit';
const String VAR_SEL=' : Please Select';
const String OTPWR='Request new OTP after 60 seconds';
const String OTPMSG='OTP verified successfully';
const String OTPERROR='Error validating OTP, try again';
const String ENTEROTP='Please Enter OTP!';
const String USER_REQUIRED='Username is Required';
const String USER_LENGTH='Username should be 2 character long';
const String MOB_REQUIRED='Mobile number required';
const String VALID_MOB='Please enter valid mobile number';
const String COUNTRY_REQUIRED='Country Code required';
const String VALID_COUNTRY='valid country code';
const String PWD_REQUIRED='Password is Required';
const String PWD_LENGTH='password should be more then 6 char long';
const String FIELD_REQUIRED='This Field is Required';
const String VALID_PIN='Please enter valid pincode';
const String PIN_REQUIRED='Pincode is Required';
const String EMAIL_REQUIRED='Email is Required';
const String VALID_EMAIL='Please enter a valid email Address';
const String  CHANGE_LANGUAGE_LBL= "Change Language";*/

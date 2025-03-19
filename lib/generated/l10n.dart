// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Explore The\n Wonders Of Biology`
  String get explore_biology {
    return Intl.message(
      'Explore The\n Wonders Of Biology',
      name: 'explore_biology',
      desc: '',
      args: [],
    );
  }

  /// `Learn everything from cells to ecosystems\n with Biotics`
  String get onboarding_title {
    return Intl.message(
      'Learn everything from cells to ecosystems\n with Biotics',
      name: 'onboarding_title',
      desc: '',
      args: [],
    );
  }

  /// `Begin Learning`
  String get begin_learning {
    return Intl.message(
      'Begin Learning',
      name: 'begin_learning',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get Sign_in_title {
    return Intl.message('Sign in', name: 'Sign_in_title', desc: '', args: []);
  }

  /// `Welcome back`
  String get welcome_back {
    return Intl.message(
      'Welcome back',
      name: 'welcome_back',
      desc: '',
      args: [],
    );
  }

  /// `We're excited to have you back, can't wait to see what you've been up to since you last logged in.`
  String get welcome_back_message {
    return Intl.message(
      'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
      name: 'welcome_back_message',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email_label {
    return Intl.message('Email', name: 'email_label', desc: '', args: []);
  }

  /// `Password`
  String get password_label {
    return Intl.message('Password', name: 'password_label', desc: '', args: []);
  }

  /// `Please enter your email`
  String get please_enter_email {
    return Intl.message(
      'Please enter your email',
      name: 'please_enter_email',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email`
  String get please_enter_valid_email {
    return Intl.message(
      'Please enter a valid email',
      name: 'please_enter_valid_email',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get please_enter_password {
    return Intl.message(
      'Please enter your password',
      name: 'please_enter_password',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid password`
  String get please_enter_valid_password {
    return Intl.message(
      'Please enter a valid password',
      name: 'please_enter_valid_password',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgot_password {
    return Intl.message(
      'Forgot Password?',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `or`
  String get or {
    return Intl.message('or', name: 'or', desc: '', args: []);
  }

  /// `Sign in`
  String get sign_in_button {
    return Intl.message('Sign in', name: 'sign_in_button', desc: '', args: []);
  }

  /// `Don't have an account?`
  String get signup_prompt {
    return Intl.message(
      'Don\'t have an account?',
      name: 'signup_prompt',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signup_title {
    return Intl.message('Sign Up', name: 'signup_title', desc: '', args: []);
  }

  /// `Sign up`
  String get signup_appbar_title {
    return Intl.message(
      'Sign up',
      name: 'signup_appbar_title',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Google`
  String get sign_in_google {
    return Intl.message(
      'Sign in with Google',
      name: 'sign_in_google',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Facebook`
  String get sign_in_facebook {
    return Intl.message(
      'Sign in with Facebook',
      name: 'sign_in_facebook',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get create_account {
    return Intl.message(
      'Create Account',
      name: 'create_account',
      desc: '',
      args: [],
    );
  }

  /// `Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!`
  String get signup_description {
    return Intl.message(
      'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
      name: 'signup_description',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email_hint {
    return Intl.message('Email', name: 'email_hint', desc: '', args: []);
  }

  /// `Please enter your email`
  String get email_empty_error {
    return Intl.message(
      'Please enter your email',
      name: 'email_empty_error',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email`
  String get email_invalid_error {
    return Intl.message(
      'Please enter a valid email',
      name: 'email_invalid_error',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password_hint {
    return Intl.message('Password', name: 'password_hint', desc: '', args: []);
  }

  /// `Please enter your password`
  String get password_empty_error {
    return Intl.message(
      'Please enter your password',
      name: 'password_empty_error',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid password`
  String get password_invalid_error {
    return Intl.message(
      'Please enter a valid password',
      name: 'password_invalid_error',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain the following :`
  String get password_requirements {
    return Intl.message(
      'Password must contain the following :',
      name: 'password_requirements',
      desc: '',
      args: [],
    );
  }

  /// `At least 1 lowercase letter`
  String get password_lowercase {
    return Intl.message(
      'At least 1 lowercase letter',
      name: 'password_lowercase',
      desc: '',
      args: [],
    );
  }

  /// `At least 1 uppercase letter`
  String get password_uppercase {
    return Intl.message(
      'At least 1 uppercase letter',
      name: 'password_uppercase',
      desc: '',
      args: [],
    );
  }

  /// `At least 1 special character`
  String get password_special_characters {
    return Intl.message(
      'At least 1 special character',
      name: 'password_special_characters',
      desc: '',
      args: [],
    );
  }

  /// `At least 1 number`
  String get password_number {
    return Intl.message(
      'At least 1 number',
      name: 'password_number',
      desc: '',
      args: [],
    );
  }

  /// `At least 8 characters long`
  String get password_length {
    return Intl.message(
      'At least 8 characters long',
      name: 'password_length',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get create_account_button {
    return Intl.message(
      'Create Account',
      name: 'create_account_button',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get already_have_an_account {
    return Intl.message(
      'Already have an account?',
      name: 'already_have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get sign_in {
    return Intl.message('Sign in', name: 'sign_in', desc: '', args: []);
  }

  /// `Your account has been created successfully.`
  String get signup_success {
    return Intl.message(
      'Your account has been created successfully.',
      name: 'signup_success',
      desc: '',
      args: [],
    );
  }

  /// `You have successfully logged in.`
  String get login_success {
    return Intl.message(
      'You have successfully logged in.',
      name: 'login_success',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get success {
    return Intl.message('Success', name: 'success', desc: '', args: []);
  }

  /// `Error`
  String get error {
    return Intl.message('Error', name: 'error', desc: '', args: []);
  }

  /// `Forgot Password`
  String get forgot_password_title {
    return Intl.message(
      'Forgot Password',
      name: 'forgot_password_title',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email address to receive a link to reset your password`
  String get forgot_password_description {
    return Intl.message(
      'Please enter your email address to receive a link to reset your password',
      name: 'forgot_password_description',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get enter_email {
    return Intl.message(
      'Enter your email',
      name: 'enter_email',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get reset_password_button {
    return Intl.message(
      'Send',
      name: 'reset_password_button',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get forgot_password_appbar {
    return Intl.message(
      'Forgot Password',
      name: 'forgot_password_appbar',
      desc: '',
      args: [],
    );
  }

  /// `A password reset link has been sent to your email.`
  String get reset_password_success_message {
    return Intl.message(
      'A password reset link has been sent to your email.',
      name: 'reset_password_success_message',
      desc: '',
      args: [],
    );
  }

  /// `OTP Verification`
  String get otp_appbar_title {
    return Intl.message(
      'OTP Verification',
      name: 'otp_appbar_title',
      desc: '',
      args: [],
    );
  }

  /// `Verify your email address`
  String get otp_verification_title {
    return Intl.message(
      'Verify your email address',
      name: 'otp_verification_title',
      desc: '',
      args: [],
    );
  }

  /// `We have just send email verification link on your email. Please check email and click on that link to verify your Email address.`
  String get otp_verification_description {
    return Intl.message(
      'We have just send email verification link on your email. Please check email and click on that link to verify your Email address.',
      name: 'otp_verification_description',
      desc: '',
      args: [],
    );
  }

  /// `After verification, click on the Continue button then Signin.`
  String get otp_verification_description2 {
    return Intl.message(
      'After verification, click on the Continue button then Signin.',
      name: 'otp_verification_description2',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get otp_verification_button {
    return Intl.message(
      'Continue',
      name: 'otp_verification_button',
      desc: '',
      args: [],
    );
  }

  /// `Please verify your email first.`
  String get otp_verification_error_message {
    return Intl.message(
      'Please verify your email first.',
      name: 'otp_verification_error_message',
      desc: '',
      args: [],
    );
  }

  /// `The email address is badly formatted.`
  String get invalidEmail {
    return Intl.message(
      'The email address is badly formatted.',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `The password is incorrect.`
  String get wrongPassword {
    return Intl.message(
      'The password is incorrect.',
      name: 'wrongPassword',
      desc: '',
      args: [],
    );
  }

  /// `No user found with this email.`
  String get userNotFound {
    return Intl.message(
      'No user found with this email.',
      name: 'userNotFound',
      desc: '',
      args: [],
    );
  }

  /// `This email is already in use by another account.`
  String get emailAlreadyInUse {
    return Intl.message(
      'This email is already in use by another account.',
      name: 'emailAlreadyInUse',
      desc: '',
      args: [],
    );
  }

  /// `The password is too weak. Try a stronger password.`
  String get weakPassword {
    return Intl.message(
      'The password is too weak. Try a stronger password.',
      name: 'weakPassword',
      desc: '',
      args: [],
    );
  }

  /// `This user account has been disabled.`
  String get userDisabled {
    return Intl.message(
      'This user account has been disabled.',
      name: 'userDisabled',
      desc: '',
      args: [],
    );
  }

  /// `Too many login attempts. Try again later.`
  String get tooManyRequests {
    return Intl.message(
      'Too many login attempts. Try again later.',
      name: 'tooManyRequests',
      desc: '',
      args: [],
    );
  }

  /// `This authentication method is not enabled.`
  String get operationNotAllowed {
    return Intl.message(
      'This authentication method is not enabled.',
      name: 'operationNotAllowed',
      desc: '',
      args: [],
    );
  }

  /// `A network error occurred. Check your connection.`
  String get networkRequestFailed {
    return Intl.message(
      'A network error occurred. Check your connection.',
      name: 'networkRequestFailed',
      desc: '',
      args: [],
    );
  }

  /// `The credential provided is invalid or expired.`
  String get invalidCredential {
    return Intl.message(
      'The credential provided is invalid or expired.',
      name: 'invalidCredential',
      desc: '',
      args: [],
    );
  }

  /// `An account already exists with a different sign-in method.`
  String get accountExistsWithDifferentCredential {
    return Intl.message(
      'An account already exists with a different sign-in method.',
      name: 'accountExistsWithDifferentCredential',
      desc: '',
      args: [],
    );
  }

  /// `This action requires recent authentication. Please log in again.`
  String get requiresRecentLogin {
    return Intl.message(
      'This action requires recent authentication. Please log in again.',
      name: 'requiresRecentLogin',
      desc: '',
      args: [],
    );
  }

  /// `This provider is already linked to the account.`
  String get providerAlreadyLinked {
    return Intl.message(
      'This provider is already linked to the account.',
      name: 'providerAlreadyLinked',
      desc: '',
      args: [],
    );
  }

  /// `This credential is already associated with another account.`
  String get credentialAlreadyInUse {
    return Intl.message(
      'This credential is already associated with another account.',
      name: 'credentialAlreadyInUse',
      desc: '',
      args: [],
    );
  }

  /// `The verification code entered is invalid.`
  String get invalidVerificationCode {
    return Intl.message(
      'The verification code entered is invalid.',
      name: 'invalidVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `The verification ID is invalid.`
  String get invalidVerificationId {
    return Intl.message(
      'The verification ID is invalid.',
      name: 'invalidVerificationId',
      desc: '',
      args: [],
    );
  }

  /// `An unknown authentication error occurred.`
  String get unknownAuthError {
    return Intl.message(
      'An unknown authentication error occurred.',
      name: 'unknownAuthError',
      desc: '',
      args: [],
    );
  }

  /// `You do not have permission to perform this action.`
  String get permissionDenied {
    return Intl.message(
      'You do not have permission to perform this action.',
      name: 'permissionDenied',
      desc: '',
      args: [],
    );
  }

  /// `The service is temporarily unavailable. Please try again later.`
  String get serviceUnavailable {
    return Intl.message(
      'The service is temporarily unavailable. Please try again later.',
      name: 'serviceUnavailable',
      desc: '',
      args: [],
    );
  }

  /// `The request took too long. Please try again.`
  String get deadlineExceeded {
    return Intl.message(
      'The request took too long. Please try again.',
      name: 'deadlineExceeded',
      desc: '',
      args: [],
    );
  }

  /// `The requested document was not found.`
  String get documentNotFound {
    return Intl.message(
      'The requested document was not found.',
      name: 'documentNotFound',
      desc: '',
      args: [],
    );
  }

  /// `This document already exists.`
  String get documentAlreadyExists {
    return Intl.message(
      'This document already exists.',
      name: 'documentAlreadyExists',
      desc: '',
      args: [],
    );
  }

  /// `The operation was cancelled.`
  String get operationCancelled {
    return Intl.message(
      'The operation was cancelled.',
      name: 'operationCancelled',
      desc: '',
      args: [],
    );
  }

  /// `The provided argument is invalid.`
  String get invalidArgument {
    return Intl.message(
      'The provided argument is invalid.',
      name: 'invalidArgument',
      desc: '',
      args: [],
    );
  }

  /// `Too many requests. Please try again later.`
  String get resourceExhausted {
    return Intl.message(
      'Too many requests. Please try again later.',
      name: 'resourceExhausted',
      desc: '',
      args: [],
    );
  }

  /// `The request cannot be processed due to a failed condition.`
  String get failedPrecondition {
    return Intl.message(
      'The request cannot be processed due to a failed condition.',
      name: 'failedPrecondition',
      desc: '',
      args: [],
    );
  }

  /// `The operation was aborted.`
  String get operationAborted {
    return Intl.message(
      'The operation was aborted.',
      name: 'operationAborted',
      desc: '',
      args: [],
    );
  }

  /// `The value provided is out of range.`
  String get outOfRange {
    return Intl.message(
      'The value provided is out of range.',
      name: 'outOfRange',
      desc: '',
      args: [],
    );
  }

  /// `Data loss has occurred.`
  String get dataLoss {
    return Intl.message(
      'Data loss has occurred.',
      name: 'dataLoss',
      desc: '',
      args: [],
    );
  }

  /// `You need to be signed in to perform this action.`
  String get unauthenticated {
    return Intl.message(
      'You need to be signed in to perform this action.',
      name: 'unauthenticated',
      desc: '',
      args: [],
    );
  }

  /// `An unexpected error occurred. Please try again later.`
  String get unknownFirestoreError {
    return Intl.message(
      'An unexpected error occurred. Please try again later.',
      name: 'unknownFirestoreError',
      desc: '',
      args: [],
    );
  }

  /// `Fill Your Profile`
  String get fillProfileAppBar {
    return Intl.message(
      'Fill Your Profile',
      name: 'fillProfileAppBar',
      desc: '',
      args: [],
    );
  }

  /// `Fill Your Profile`
  String get fillProfileTitle {
    return Intl.message(
      'Fill Your Profile',
      name: 'fillProfileTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please take a few minutes to fill out your profile with as much detail as possible.`
  String get fillProfileDescription {
    return Intl.message(
      'Please take a few minutes to fill out your profile with as much detail as possible.',
      name: 'fillProfileDescription',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstName {
    return Intl.message('First Name', name: 'firstName', desc: '', args: []);
  }

  /// `Last Name`
  String get lastName {
    return Intl.message('Last Name', name: 'lastName', desc: '', args: []);
  }

  /// `Academic Year`
  String get academicYear {
    return Intl.message(
      'Academic Year',
      name: 'academicYear',
      desc: '',
      args: [],
    );
  }

  /// `Your Phone Number`
  String get yourPhoneNumber {
    return Intl.message(
      'Your Phone Number',
      name: 'yourPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your first name`
  String get pleaseEnterFirstName {
    return Intl.message(
      'Please enter your first name',
      name: 'pleaseEnterFirstName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your last name`
  String get pleaseEnterLastName {
    return Intl.message(
      'Please enter your last name',
      name: 'pleaseEnterLastName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your phone number`
  String get pleaseEnterYourPhoneNumber {
    return Intl.message(
      'Please enter your phone number',
      name: 'pleaseEnterYourPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid phone number`
  String get pleaseEnterValidPhoneNumber {
    return Intl.message(
      'Please enter a valid phone number',
      name: 'pleaseEnterValidPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Select your grade`
  String get selectGrade {
    return Intl.message(
      'Select your grade',
      name: 'selectGrade',
      desc: '',
      args: [],
    );
  }

  /// `Fourth primary grade`
  String get fourthPrimary {
    return Intl.message(
      'Fourth primary grade',
      name: 'fourthPrimary',
      desc: '',
      args: [],
    );
  }

  /// `Fifth primary grade`
  String get fifthPrimary {
    return Intl.message(
      'Fifth primary grade',
      name: 'fifthPrimary',
      desc: '',
      args: [],
    );
  }

  /// `Sixth primary grade`
  String get sixthPrimary {
    return Intl.message(
      'Sixth primary grade',
      name: 'sixthPrimary',
      desc: '',
      args: [],
    );
  }

  /// `First preparatory grade`
  String get firstPreparatory {
    return Intl.message(
      'First preparatory grade',
      name: 'firstPreparatory',
      desc: '',
      args: [],
    );
  }

  /// `Second preparatory grade`
  String get secondPreparatory {
    return Intl.message(
      'Second preparatory grade',
      name: 'secondPreparatory',
      desc: '',
      args: [],
    );
  }

  /// `Third preparatory grade`
  String get thirdPreparatory {
    return Intl.message(
      'Third preparatory grade',
      name: 'thirdPreparatory',
      desc: '',
      args: [],
    );
  }

  /// `First secondary grade`
  String get firstSecondary {
    return Intl.message(
      'First secondary grade',
      name: 'firstSecondary',
      desc: '',
      args: [],
    );
  }

  /// `Second secondary grade`
  String get secondSecondary {
    return Intl.message(
      'Second secondary grade',
      name: 'secondSecondary',
      desc: '',
      args: [],
    );
  }

  /// `Third secondary grade`
  String get thirdSecondary {
    return Intl.message(
      'Third secondary grade',
      name: 'thirdSecondary',
      desc: '',
      args: [],
    );
  }

  /// `BioChemistry`
  String get bioChemistry {
    return Intl.message(
      'BioChemistry',
      name: 'bioChemistry',
      desc: '',
      args: [],
    );
  }

  /// `Please select a grade`
  String get pleaseSelectGrade {
    return Intl.message(
      'Please select a grade',
      name: 'pleaseSelectGrade',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get fillProfileSubmitButton {
    return Intl.message(
      'Submit',
      name: 'fillProfileSubmitButton',
      desc: '',
      args: [],
    );
  }

  /// `Your profile has been filled successfully.`
  String get fill_profile_success_message {
    return Intl.message(
      'Your profile has been filled successfully.',
      name: 'fill_profile_success_message',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

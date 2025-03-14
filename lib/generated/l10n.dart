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

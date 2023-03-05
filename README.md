# Supabase Auth and Database

Supabase is an open source Firebase alternative providing all the backend features you need to build a product.
In this flutter app, I have implemented email-password,facebook,github,phone authentication and Supabase database.

![Supabase_logo](https://github.com/rp3110/supabase/blob/main/screenshot/supabase.png)

- Flutter App
- Supabase


# Features
- Email login
- Email signup
- Login with phone
- Facebook auth
- Github auth
- Database
- Provider




# Let's Code
- Add these dependencies in **pubspec.yaml** and hit **Pub Get**


| dependencies |
|--------------|
| supabase     |
| provider     |
| url_launcher |
| uni_links    |


- Create a new supabase project and store the key and url to a class and using key and url create a new **SupabaseClient**.

```
 static SupabaseClient supabaseCredential = SupabaseClient(apiURL, apiKey);
```
- create ui according to your need
- Setup supabase as per below images.
- If there is need of facebook,github or phone login then setup the application by following links mentioned in reference.
- Create service and provider class for database and authentication. In service class we will define all the method for the required operation using **SupabaseClient**
  For Example.
```
///for auth
Future login({
    required String email,
    required String password,
  }) async {
    GotrueSessionResponse response =
        await SupabaseCredentials.supabaseCredential.auth.signIn(
            email: email,
            password: password,
            options: AuthOptions(redirectTo: SupabaseCredentials.apiURL));
    if (response.error == null) {
      String? signUpEmail = response.data!.user!.email;
      print('Login Successful: $signUpEmail ');
      NavigatorKey.navigatorKey.currentState!
          .popAndPushNamed(AppRoutes.homeScreen, arguments: 0);
    } else {
      print('Login failed: ${response.error!.message}');
    }
  }
```

```
///for data base
  Future addToDo({required String title, required String description}) async {
    PostgrestResponse response = await SupabaseCredentials.supabaseCredential
        .from('todo')
        .insert({'title': title, 'description': description}).execute();
    if (response.data != null) {
      var data = response;
      return data;
    } else {
      print(response.status);
    }
  }
```

-  Provider class extends **ChangeNotifier** and contains methods to call Service methods.
-  Add providers to root widget with multiprovider
- In sign-in or sign-up page we will use this provider methods to perform authentication on click of corresponding buttons.
- For the database, the process will be same as sign-in but here we have to display data so I have taken a future builder for managing states.

# Reference
 - [Supabase Docs](https://supabase.com/docs)
 - [Facebook setup](https://medium.com/inspireui/setup-facebook-login-for-flutter-apps-4e7bd031479d)
 - [Github setup](https://docs.github.com/en/apps/oauth-apps/building-oauth-apps/creating-an-oauth-app)
 - [Twilio setup](https://www.twilio.com/blog/get-started-twilio-free-sms-businesses#:~:text=Get%20started%20for%20free%20with,up%20SMS%20for%20your%20business)

# Supabase setup
![supabase_setup1](https://github.com/rp3110/supabase/blob/main/screenshot/supabase_setup1.png)
![supabase_setup2](https://github.com/rp3110/supabase/blob/main/screenshot/supabase_setup2.png)
![supabase_setup3](https://github.com/rp3110/supabase/blob/main/screenshot/supabase_setup3.png)
![supabase_setup4](https://github.com/rp3110/supabase/blob/main/screenshot/supabase_setup4.png)
![supabase_setup5](https://github.com/rp3110/supabase/blob/main/screenshot/supabase_setup5.png)
![supabase_setup6](https://github.com/rp3110/supabase/blob/main/screenshot/supabase_setup6.png)
![supabase_setup7](https://github.com/rp3110/supabase/blob/main/screenshot/supabase_setup7.png)

# App Preview
![app_preview](https://github.com/rp3110/supabase/blob/main/screenshot/app_preview.png)


# Created By
- Rutu Hirapara


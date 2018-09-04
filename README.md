# Kagikari: 鍵借り管理システム

## Install and Run
```
$ bundle install
$ rails db:create
$ rails s
```

## Add User
To use `Kagikari`, you should create new user account.

```
$ rails c
> User.create!(screen_name: "example2018", name: "Example User", password: "foobar1024", password_confirmation: "foobar1024")
```

After, you can log in with `screen_name`(`ID`) and `password`.

## To Do
 - Export activities
 - Sign up feature
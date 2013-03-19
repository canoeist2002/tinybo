该网络应用是在 Michael Hartl 的 railstutorial 教程的基本框架下完成的，只是做了部分的修改！

## 关于

* 该网站使用的是 Rails3BootstrapDeviseCancan 生成的基本框架；

* 中文化了网站的内容，但并没有实现对国际化的支持（因为无须用到国际化）；

* Devise 该应用的用户管理部分采用了 devise 模块来完成，如用户登陆、用户注册、用户管理和注销；

* Simple_form 该应用的表单管理在 Simple_form 的帮助下完成，并实现了一些强大的表单功能；

* Cancan 和 rolify 主要用于基于用户角色的授权使用，限制用户访问相应的功能；

* friendly_id 来于将用户的 ID 代换成更加便于人阅读的代码，并能更友好的被人阅读；

* gravtastic 为每一个用户准备一个头像，使用 http://gravatar.com/ 来完成头像的处理；

* rspec-rails 使用了新的版本，后老的版本还是有很大的不同的，很多测试可能无法通过，需要重写测试；

* 虽然还可以加入留言，投票都一系列的功能，但我并没有去做，留到别的项目里来实现。

## 安装

需要使用 Ruby 1.9.2+ 来安装：

    $ bundle install
    $ bundle exec rake db:migrate
    $ rails s

## 访问

你可以通过 [http://localhost:3000](http://localhost:3000) 来访问。

## 添加管理员账号

管理员账号可以用于删除其它的账号：

    $ rails console
    > admin = User.create(name:"admin", email:"admin@example.com", password:"foobar", password_confirmation:"foobar")
    > admin.add_role :admin

## 演示版本

你可以在 heroku 上查看本程序的演示程序，点击这里 [Tinybo](http://serene-coast-3395.herokuapp.com/)

## License

MIT License


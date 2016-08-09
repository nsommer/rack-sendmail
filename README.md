rack-sendmail
=============

rack-sendmail is a minimalistic rack app for sending emails. It's written to
provide a simple backend for contact forms of static web pages.

## Features

* Sends emails
* Hides the target mail address from the sender
* Built for AJAX/JSON

## Setup mail server connection

The connection to the mail server is configured in `config/setup.rb`. By default,
it reads the values from environment variables. **Tip**: Use [rbenv-vars](https://github.com/rbenv/rbenv-vars) to safely store the configuration
info.

```bash
RACKSENDMAIL_SERVER="smtp.my-mailserver.com"
RACKSENDMAIL_PORT="587"
RACKSENDMAIL_HELO="my-domain.com"
RACKSENDMAIL_USERNAME="mailserver-user"
RACKSENDMAIL_PASSWORD="misterious-password"
RACKSENDMAIL_TARGET_MAIL="bob@example.org"
```

You can also use the `RackSendmail#setup` method as shown below.

```ruby
RackSendmail.setup do |config|
  config.server = 'smtp.my-mailserver.com'
  config.port = 25
  config.helo = 'my-domain.com'
  config.username = 'mailserver-user'
  config.password = 'misterious-password'
  config.target_mail = 'bob@example.org'
end
```

## Run locally

```bash
rackup config.ru
```

## Deployment

Thanks to the `config.ru` file, most ruby application servers can be used for
deployment, such as unicorn, passenger, ... The web app root folder is the root
folder of this repository.

In the context of contact forms for static sites, which is the scenario this
app is made for, consider this site setup:

* Use nginx to server static HTML pages
* Route requests with the path `/mails` to a UNIX socket
* Let your favorite app server (e.g. unicorn) listen on the socket

## Request interface

Only `POST` requests are allowed. The following parameters are required.

* `sender`: e-mail address of the sender
* `message`: The message body
* `subject`: The subject line of the e-mail
* `sender_name`: The full name of the sender **(optional)**

## License

This project is available under the MIT license.

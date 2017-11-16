
# OSCaRWebSite

### Requirements

* Postgres(>= 10.0)
* Ruby(2.4.1)
* Rails(5.1.4)

### Getting Start

Given that you got all the requirements running on your local machine.

Clone the project to your local machine:

```
git@github.com:rotati/oscar-website.git
```

Navigate to the project directory and create `.env` in project root path, and copy all content in `.env.example` and replace all variable values to fit your local machine.

Then run:

```
  bundle install

  rake db:create

  rake db:migrate

```

Once the steps are done, start the server by running:

```
  rails server
```

Open a web browser and navigate to `http://lvh.me:3000`, and there you go!

### Issue Reporting

If you experience with bugs or need further improvement, please create a new issue in the repo issue list.

### Contributing to OSCaRWebSite

Pull requests are very welcome. Before submitting a pull request, please make sure that your changes are well tested. Pull requests without tests will not be accepted.

### Authors

OSCaRWebSite is developed in partnership by [Rotati Consulting](http://www.rotati.com) and [CIF](http://www.childreninfamilies.org)
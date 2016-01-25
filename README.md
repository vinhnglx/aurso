# AURSO

[![Circle CI](https://circleci.com/gh/vinhnglx/aurso.svg?style=svg)](https://circleci.com/gh/vinhnglx/aurso)

A simple API-application.

Support:

- An API returns list of cars type.

- An API creates new car type.

## HOW TO RUN:

### Clone the project and setup gem dependencies

```
git clone https://github.com/vinhnglx/aurso.git
cd aurso
```

```
gem install bundler
bundle install
```

### Setup environment variables

```
cp config/application.yml.sample config/application.yml
cp config/secrets.yml.sapmle config/secrets.yml
```

```
# application.yml

FLEXIBLE_URL: 'http://reuters.com'
FIXED_URL: 'https://developer.github.com/v3/#http-redirects'
PRESTIGE_URL: 'http://www.yourlocalguardian.co.uk/sport/rugby/rss/'
```

### Setup database

```
cp config/database.yml.sample config/database.yml
```

```
bin/rake db:create
bin/rake db:migrate
```

### Create some fake records

```
bin/rake db:seed
```

### APIs note

**API returns list of car types**

- Request:

```
URL: /cars/:model_slug/car_types/
TYPE: GET
```

- JSON response - Status: 200

```
{
  "cars": [
    {
      "name": "BMW",
      "pricing_policy": "Flexible",
      "car_types": [
        {
          "name": "Serie 0",
          "base_price": 118842,
          "total_price": 582326
        },
        {
          "name": "Serie 1",
          "base_price": 294941,
          "total_price": 1445211
        }
      ]
    },
    {
      "name": "BMW",
      "pricing_policy": "Fixed",
      "car_types": [
        {
          "name": "Serie 0",
          "base_price": 118842,
          "total_price": 118857
        },
        {
          "name": "Serie 1",
          "base_price": 294941,
          "total_price": 294956
        }
      ]
    }
  ]
}
```

**API returns list of car types**

- Request:

```
URL: /cars/:model_slug/car_types/:model_type_slug
TYPE: POST
HEADER: Authorization => Token token=xxxxxxxxxxxxxxxxxxxxx
PARAMETERS:
- name          - Required
- base_price    - Required
```

- JSON response - Status: 201

```
{
  "car_type": {
    "name": "Mercedes",
    "base_price": 230942,
    "total_price": 1131616
  }
}
```

### Run test cases

```
bundle exec rspec spec
```

### Run the server and enjoy

```
bin/rails server
```

## NOTE:

- This project is built in the short time so some parts needs to be refactored and write more test cases.

- Project's performance is the little bit slowly, need to be improve.

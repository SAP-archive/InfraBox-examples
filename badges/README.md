Badges
======

With InfraBox you can easily create badges like <img src="https://img.shields.io/badge/coverage-99%25-red.svg"> or <img src="https://img.shields.io/badge/MySubject-MyStatus-green.svg">. You may create several for each job depending on your needs. Simply create a json file for each badge in _/infrabox/upload/badge/_ like this _custom-badge.json_ file:

```json
{
    "version": 1,
    "subject": "My Custom Badge",
    "status": "It works!",
    "color": "green"
}
```

Every time your job is exected a badge will be generated for you. You can get a static link to it in the InfraBox Dashboard for including it somewhere else.

See also the [documentation](https://infrabox.ninja/docs/#create-badges) for creating badges.

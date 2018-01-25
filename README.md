# Simple Scrapper

This is a tiny scrapper API that allows to scrape web pages and index their content. It utilizes `Ruby on Rails`, `PostgreSQL` database.
If a valid url is provided, scrapper will grab the page's contents inside of heading and link HTML elements and will store it to database.

### Installation
Download or `git clone` this repo.
```
$ cd scrapper
$ bundle install
$ rake db:create
$ rake db:migrate
$ rails s
```

Go to `http://localhost:3000` in your browser.

### Content's HTML Elements
**Headings**:
- `<h1>`
- `<h2>`
- `<h3>`

**Links**:
- `<a>`

### Endpoints
1. Receive all recorded urls and their content
  ```
  [GET] http://localhost:3000/api/pages
  ```
2. Scrape web page and extract its content within heading and link tags
```
 [POST] http://localhost:3000/api/pages?url=[valid url]
```

### Responses
Response is JSON
**Response** is JSON:
```
{
  id: 1,
  url: "http://vsasnouski.me",
  content: {
    h1: ["Vlad Sasnouski", "About me"],
    h2: [
      "Hello!",
      "IndieNoMo",
      "Counter-Stats: GO",
      "Tetris",
      "DOMbledore",
      "Skills",
      "Get in touch"
    ],
    h3: ["Location", "Email", "Phone"],
    a: [
      "#intro",
      "#zero",
      "#one",
      "#two",
      "#three",
      "#zero",
      "assets/vlad_sasnouski_resume.pdf",
      "assets/vlad_sasnouski_resume.pdf",
      "https://indienomo.herokuapp.com/",
      "https://indienomo.herokuapp.com/",
      "https://github.com/usasnouski/IndieNoMo",
      "https://github.com/usasnouski/DOMbledore/",
      "https://cs-go-33263.firebaseapp.com/",
      "https://github.com/dawah-wadah/demo-parser",
      "https://usasnouski.github.io/Tetris/",
      "https://usasnouski.github.io/Tetris",
      "https://github.com/usasnouski/Tetris",
      "https://github.com/usasnouski/DOMbledore/",
      "https://github.com/usasnouski/DOMbledore",
      "mailto:usasnouski@gmail.com",
      "https://github.com/usasnouski/",
      "https://www.linkedin.com/in/vlad-sasnouski",
      "https://angel.co/vlad-sasnouski"
    ]
  }
}
```

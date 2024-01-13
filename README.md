# Recipe App

<a name="readme-top"></a>

<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📖 About the Project](#about-project)
- [🛠 Built With](#built-with)
  - [Tech Stack](#tech-stack)
  - [Key Features](#key-features)
- [💻 Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Setup](#setup)
  - [Usage](#usage)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [📝 License](#license)

<!-- PROJECT DESCRIPTION -->

## 📖 Recipe App <a name="about-project"></a>

The **Recipe app** is a comprehensive solution for managing recipes, ingredients, and inventory, designed using Ruby on Rails with a PostgreSQL database. This fully functional application allows users to save ingredients, keep track of their inventory, create recipes, and generate shopping lists based on what they have and what they are missing from a recipe. An important feature of the app is its ability to make recipes public, enabling anyone to access them. This promotes the sharing of recipes, which is a vital part of cooking. The Recipe app is not just an application, but a cooking companion that enhances the cooking experience by organizing and simplifying the process.

## 🛠 Built With <a name="built-with"></a>

<details> <summary>Programming Language</summary> <ul> <li>Ruby 3.2.2</li> </ul> </details>

<details> <summary>Web Application Framework</summary> <ul> <li>Rails 7.1.2</li> </ul> </details>

<details> <summary>Database</summary> <ul> <li>PostgreSQL (pg gem)</li> </ul> </details>

<details> <summary>Web Server</summary> <ul> <li>Puma</li> </ul> </details>

<details> <summary>JavaScript Modules</summary> <ul> <li>ESM Import Maps (importmap-rails gem)</li> </ul> </details>

<details> <summary>UI Styling</summary> <ul> <li>Tailwind CSS (tailwindcss-rails gem)</li> </ul> </details>

<details> <summary>Hotwire</summary> <ul> <li>Turbo (turbo-rails gem)</li> <li>Stimulus (stimulus-rails gem)</li> </ul> </details>

<details> <summary>APIs</summary> <ul> <li>Jbuilder</li> </ul> </details>

<details> <summary>Performance Optimization</summary> <ul> <li>Bootsnap</li> </ul> </details>

<details> <summary>Testing</summary> <ul> <li>Debug</li> <li>Factory Bot (factory_bot_rails gem)</li> <li>RSpec (rspec-rails gem)</li> <li>Capybara</li> <li>Selenium Webdriver</li> </ul> </details>

<details> <summary>Code Quality</summary> <ul> <li>Rubocop</li> </ul> </details>

<details> <summary>Development Tools</summary> <ul> <li>Web Console (web-console gem)</li> </ul> </details>

<details> <summary>Pagination</summary> <ul> <li>Kaminari</li> </ul> </details>

<details> <summary>Authentication</summary> <ul> <li>Devise (devise gem)</li> </ul> </details>

<details> <summary>Authorization</summary> <ul> <li>CanCanCan (cancancan gem)</li> </ul> </details>

<!-- Features -->

### Key Feature <a name="key-features"></a>

- [x] Rails Setup
- [x] Data Model Setup
- [x] Models Created for Recipes, Ingredients, and Inventory
- [x] Class Association Implemented among Recipes, Ingredients, and Inventory
- [x] Custom Methods Implemented to Fetch and Manipulate Data
- [x] Models Data Validation Implemented for Recipe Creation and Ingredient Addition
- [x] Models Unit Testing Applied
- [x] Feature to Generate Shopping List Based on Inventory and Recipe Requirements
- [x] Feature to Make Recipes Public for Sharing
- [x] PostgreSQL Database Integration

<p align="right"><a href="#readme-top">👆</a></p>

<!-- Getting Started -->

## 💻 Getting Started <a name="getting-started"></a>

To get started with the project, follow the steps below.

### Prerequisites

To run this project, ensure you have the following installed:

- [Git](https://git-scm.com/)
- [Ruby](https://www.ruby-lang.org/en/)
- A code editor (e.g., [VsCode](https://code.visualstudio.com/))

### Setup

Clone the repository to your local machine:

```bash
git clone https://github.com/fmanimashaun/recipe-app.git

cd recipe-app

bundle install
```

## Database Setup

This application uses PostgreSQL as the database. Here are the steps to set it up:

1. Ensure PostgreSQL is installed on your machine and running.

2. Update the config/database.yml file with your PostgreSQL username and password in the default section.

3. Create the database:

```bash
rails db:create
```

4. Run migrations to set up the database schema:

```bash
rails db:migrate
```

### Usage

To run the program, you can use a Ruby interpreter. For example, to interact with the code, use the following:

1. Start the server

```bash
bin/dev
```

2. Access the Blog app in your web browser at `http://localhost:3000`.

<p align="right"><a href="#readme-top">👆</a></p>

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>

👤 **Fisayo Michael Animashaun**

- GitHub: [@fmanimashaun](https://github.com/fmanimashaun)
- Twitter: [@fmanimashaun](https://twitter.com/fmanimashaun)
- LinkedIn: [Fisayo Michael Animashaun ](https://linkedin.com/in/fmanimashaun)

<p align="right"><a href="#readme-top">👆</a></p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

- implement database

<p align="right"><a href="#readme-top">👆</a></p>

<!-- Contributing -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the issues page.

[Issue Page](https://github.com/fmanimashaun/myblog/issues)

<p align="right"><a href="#readme-top">👆</a></p>

<!-- Show your support -->

## ⭐️ Show your support <a name="support"></a>

If you like this project leave a start for it.

<p align="right"><a href="#readme-top">👆</a></p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

I'd like to thank Microverse for helping us in the journey to become a Fullstack developer.

<p align="right"><a href="#readme-top">👆</a></p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right"><a href="#readme-top">👆</a></p>

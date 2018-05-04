# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require './app/models/application_record'
require './app/models/category'
require './app/models/dork'

Category.create!(id: 1, title: 'Footholds')
Category.create!(id: 2, title: 'Files Containing Usernames')
Category.create!(id: 3, title: 'Sensitive Directories')
Category.create!(id: 4, title: 'Web Server Detection')
Category.create!(id: 5, title: 'Vulnerable Files')
Category.create!(id: 6, title: 'Vulnerable Servers')
Category.create!(id: 7, title: 'Error Messages')
Category.create!(id: 8, title: 'Files Containing Juicy Info')
Category.create!(id: 9, title: 'Files Containing Passwords')
Category.create!(id: 10, title: 'Sensitive Online Shopping Info')
Category.create!(id: 11, title: 'Network or Vulnerability Data')
Category.create!(id: 12, title: 'Pages Containing Login Portals')
Category.create!(id: 13, title: 'Various Online Devices')
Category.create!(id: 14, title: 'Advisories and Vulnerabilities')

Dork.create!(
  title: 'intitle:"Installing TYPO3 CMS"',
  search: 'intitle:"Installing TYPO3 CMS"',
  author: '_palonE',
  description: '',
  category_id: 1)
Dork.create!(
    title: 'inurl:/install/stringnames.txt',
    search: 'inurl:/install/stringnames.txt',
    author: 'Nisankh Acharjya',
    description: 'inurl:/install/stringnames.txt this DORK is useful to search moodle cms with install folder left on the hosted server',
    category_id: 1)
Dork.create!(
  title: 'inurl:/_layouts/mobile/view.aspx?List=',
  search: 'inurl:/_layouts/mobile/view.aspx?List=',
  author: 'anonymous',
  description: '',
  category_id: 2)
Dork.create!(
    title: '"authentication failure; logname=" ext:log',
    search: '"authentication failure; logname=" ext:log',
    author: 'anonymous',
    description: '',
    category_id: 2)
Dork.create!(
  title: ':DIR | intitle:index of inurl://whatsapp/',
  search: ':DIR | intitle:index of inurl://whatsapp/',
  author: 'Parth S. Patel',
  description: '',
  category_id: 3)
Dork.create!(
    title: '"authentication failure; logname=" ext:log',
    search: '"authentication failure; logname=" ext:log',
    author: 'anonymous',
    description: '',
    category_id: 3)
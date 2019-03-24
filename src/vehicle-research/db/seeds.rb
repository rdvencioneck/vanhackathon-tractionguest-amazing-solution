# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

clients = Client.create(
    [
        { name: 'Abel', email: 'abel@mycar.com'},
        { name: 'Beth', email: 'beth@mycar.com'},
        { name: 'Cain', email: 'cain@mycar.com'},
        { name: 'David', email: 'david@mycar.com'},
        { name: 'Elias', email: 'elias@mycar.com'}
    ]
)

vehicles = Vehicle.create(
    [
        {
            plate: 'AAA0001',
            brand: 'FORD',
            model: 'K',
            model_year: '2019',
            color: 'PLATINUM',
            client_ids: [clients[0].id]
        },
        {
            plate: 'AAA0002',
            brand: 'TVR',
            model: 'Typhon',
            model_year: '2000',
            color: 'ONYX',
            client_ids: [clients[2].id]
        },
        {
            plate: 'ABBA877',
            brand: 'Chrysler',
            model: '300',
            model_year: '2004',
            color: 'SILVER',
            client_ids: [clients[0].id, clients[3].id]
        },
        {
            plate: 'ZIX8849',
            brand: 'Tesla',
            model: 'Model 3',
            model_year: '2018',
            color: 'RUBY',
            client_ids: [clients[4].id]
        }
    ]
)
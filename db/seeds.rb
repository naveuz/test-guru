# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([
     { name: 'User1', email: 'test@test.net', password: '123456' },
     { name: 'User2', email: 'info@info.com', password: 'abcde' }
                    ])

admins = Admin.create([
     { name: 'admin1', email: 'test@test.net', password: '123456' },
     { name: 'admin2', email: 'info@info.com', password: 'abcde' }
                    ])

categories = Category.create([{title: 'Литература'},
                              {title: 'История'},
                              {title: 'География'}])

tests = Test.create([
     { title: 'Русские писатели', level: 1, category_id: categories[0].id, admin_id: admins[0].id },
     { title: 'Исторические даты', level: 2, category_id: categories[1].id, admin_id: admins[0].id },
     { title: 'Столицы стран мира', level: 3, category_id: categories[2].id, admin_id: admins[1].id }
                    ])

questions = Question.create([
     { body: 'Преступление и наказание', test_id: tests[0].id },
     { body: 'Тихий дон', test_id: tests[0].id },
     { body: 'Год начала первой мировой войны', test_id: tests[1].id },
     { body: 'Год окончания второй мировой войны', test_id: tests[1].id },
     { body: 'Германия', test_id: tests[2].id },
     { body: 'Испания', test_id: tests[2].id }
                            ])

Answer.create([
     { body: 'Достоевский', correct: true, question_id: questions[0].id },
     { body: 'Пушкин', correct: false, question_id: questions[0].id },
     { body: 'Чехов', correct: false, question_id: questions[0].id },
     { body: 'Шолохов', correct: true, question_id: questions[1].id },
     { body: 'Достоевский', correct: false, question_id: questions[1].id },
     { body: 'Островский', correct: false, question_id: questions[1].id },
     { body: '1914', correct: true, question_id: questions[2].id },
     { body: '1905', correct: false, question_id: questions[2].id },
     { body: '1941', correct: false, question_id: questions[2].id },
     { body: '1945', correct: true, question_id: questions[3].id },
     { body: '1918', correct: false, question_id: questions[3].id },
     { body: '1939', correct: false, question_id: questions[3].id },
     { body: 'Берлин', correct: true, question_id: questions[4].id },
     { body: 'Париж', correct: false, question_id: questions[4].id },
     { body: 'Вена', correct: false, question_id: questions[4].id },
     { body: 'Мадрид', correct: true, question_id: questions[5].id },
     { body: 'Барселона', correct: false, question_id: questions[5].id },
     { body: 'Будапешт', correct: false, question_id: questions[5].id }
              ])

PassingTest.create([
     { user_id: users[0].id, test_id: tests[1].id },
     { user_id: users[0].id, test_id: tests[2].id },
     { user_id: users[1].id, test_id: tests[0].id }
                   ])
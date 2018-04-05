digital = Format.create(name: "Digital")
hardcover = Format.create(name: "Hardcover")
softcover = Format.create(name: "Softcover")

dylan = Author.create(name: "Dylan Richards" )
suzi = Author.create(name: "Suzi Carmichael" )
ned = Author.create(name: "Ned Smith" )
charles = Author.create(name: "Charles McGehee" )
aldyth = Author.create(name: "Aldyth Piccadilly" )

ogilvy = Book.create(title: "Ogilvy On Advertising",
                   authors: [dylan],
                   format: hardcover,
                   release_date: Date.strptime("04/20/2018", "%m/%d/%Y"),
                   base_price: 20
                  )
startup = Book.create(title: "The $100 Startup",
                   authors: [suzi, dylan, ned],
                   format: digital,
                   release_date: Date.strptime("04/20/2019", "%m/%d/%Y"),
                   base_price: 20
                  )

be_here_now = Book.create(title: "Be Here Now",
                   authors: [ned],
                   format: softcover,
                   release_date: Date.strptime("04/20/2020", "%m/%d/%Y"),
                   base_price: 20
                  )

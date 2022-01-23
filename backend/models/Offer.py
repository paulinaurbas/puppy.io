from models.Dog import Dog

class Offer(Dog):
    id: int
    owner_email: str
    localization: []
    pictures: []

    def toJSON(self):
        return {
            'id': self.id,
            'name': self.name,
            'breed': self.breed,
            'age': self.age,
            'sex': self.sex,
            'description': self.description,
            'ownerEmail': self.owner_email,
            'localization': self.localization,
            'pictures': self.pictures
        }

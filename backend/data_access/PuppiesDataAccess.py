from models.Dog import Dog
from models.Offer import Offer
from models.User import User
from repositories.PuppiesRepository import PuppiesRepository
from helpers import FilterHelper as fh


class PuppiesDataAccess:
    repo = PuppiesRepository()

    def add_user(self, data):
        user = User()
        user.username = data.get('username')
        user.password = data.get('password')
        user.email = data.get('email')

        self.repo.add_user(user)

    def get_user_login_data(self, data) -> User:
        return self.repo.get_user_login_data(data.get('username'), data.get('password'))

    def get_user_id(self, data) -> int:
        return self.repo.get_user_id(data.get('username'))

    def get_user_id_by_str(self, username: str) -> int:
        return self.repo.get_user_id(username)

    def add_dog(self, data, username: str):
        dog = Dog()
        pictures = data.get("pictures")
        localization = data.get("localization")
        dog.name = data.get("name")
        dog.breed = data.get("breed")
        dog.age = data.get("age")
        dog.sex = data.get("sex")
        dog.description = data.get("description")

        self.repo.add_dog(dog, username, pictures, localization)

    def get_dog_offer(self, id: int) -> Offer:
        return self.repo.get_dog_offer(id)

    def get_dog_offers(self, owner_id: int) -> []:
        return self.repo.get_dog_offers(owner_id)

    def get_filtered_dog_offers(self, data) -> []:
        all_offers = self.repo.get_all_dog_offers()

        localization = data.get("localization")
        localization_range = data.get("localizationRange")
        if localization and len(localization) == 2 and localization_range:
            all_offers = fh.filter_by_localization(all_offers, localization, localization_range)

        breeds = data.get('breeds')
        if breeds and len(breeds) > 0:
            all_offers = fh.filter_by_breeds(all_offers, breeds)

        age_low = data.get('ageLow')
        age_high = data.get('ageHigh')
        if age_low or age_high:
            all_offers = fh.filter_by_age(all_offers, 0 if not age_low else age_low, 100 if not age_high else age_high)

        is_male = data.get('isMale')
        if is_male is not None:
            all_offers = fh.filter_by_sex(all_offers, is_male)

        return all_offers

    def update_dog(self, data, username: str, id: int):
        dog = Dog()
        pictures = data.get("pictures")
        localization = data.get("localization")
        dog.name = data.get("name")
        dog.breed = data.get("breed")
        dog.age = data.get("age")
        dog.sex = data.get("sex")
        dog.description = data.get("description")
        self.repo.update_dog(dog, username, pictures, localization, id)

    def delete_dog(self, id: int):
        self.repo.delete_dog(id)

    def rollback(self):
        self.repo.rollback()


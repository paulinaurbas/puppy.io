import math

R = 6371


def filter_by_localization(offers: [], localization: [], localization_range: int) -> []:
    filtered = []
    for offer in offers:
        val = __get_distance_between_points(offer.localization[0],
                     localization[0],
                     offer.localization[1],
                     localization[1]) <= localization_range
        if val:
            filtered.append(offer)

    return filtered


def filter_by_breeds(offers: [], breeds: []) -> []:
    filtered = []
    for offer in offers:
        if offer.breed in breeds:
            filtered.append(offer)

    return filtered


def filter_by_age(offers: [], age_low: int, age_high: int) -> []:
    filtered = []
    for offer in offers:
        if age_low <= offer.age <= age_high:
            filtered.append(offer)

    return filtered


def filter_by_sex(offers: [], sexes: []) -> []:
    filtered = []
    for offer in offers:
        if offer.sex in sexes:
            filtered.append(offer)

    return filtered


def __get_distance_between_points(lat1: float, lat2: float, lon1: float, lon2: float):
    fi1 = float(lat1) * math.pi / 180
    fi2 = float(lat2) * math.pi / 180
    delta_fi = (float(lat2) - float(lat1)) * math.pi / 180
    delta_lam = (float(lon2) - float(lon1)) * math.pi / 180
    a = (math.sin(delta_fi / 2) ** 2) + math.cos(fi1) * math.cos(fi2) * (math.sin(delta_lam / 2) ** 2)
    c = 2 * math.atan2(math.sqrt(a), math.sqrt(1-a))

    return R * c

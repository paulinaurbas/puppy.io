def resolve_query(query: str, parameters: dict) -> str:
    for key in parameters:
        if isinstance(parameters[key], list):
            str_value = __list_to_select_union(parameters[key])
        else:
            str_value = parameters[key]

        query = query.replace(f'@{key}', str_value)

    return query

def __list_to_select_union(l: list) -> str:
    output = "("
    for index, item in enumerate(l):
        output += f"SELECT {item}"
        if index < len(l) - 1:
            output += " UNION ALL "

    return output + ")"

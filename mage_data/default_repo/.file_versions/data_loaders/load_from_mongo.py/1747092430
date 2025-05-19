from mage_ai.settings.repo import get_repo_path
from mage_ai.io.config import ConfigFileLoader
from mage_ai.io.mongodb import MongoDB
from os import path
from bson.decimal128 import Decimal128  # 1) import do tipo

if 'data_loader' not in globals():
    from mage_ai.data_preparation.decorators import data_loader
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test

@data_loader
def load_from_mongodb(*args, **kwargs):
    config_path = path.join(get_repo_path(), 'io_config.yaml')
    config_profile = 'default'

    query = {}
    # 2) carrega todos os dados da collection
    df = MongoDB.with_config(
        ConfigFileLoader(config_path, config_profile)
    ).load(
        query=query,
        collection='listingsAndReviews',
    )

    # 3) função de conversão
    def convert_decimal(x):
        if isinstance(x, Decimal128):
            # .to_decimal() retorna Decimal, aí convertemos pra float
            return float(x.to_decimal())
        return x

    # aplica a conversão a toda a tabela
    df = df.applymap(convert_decimal)

    return df

@test
def test_output(output, *args) -> None:
    assert output is not None, 'The output is undefined'

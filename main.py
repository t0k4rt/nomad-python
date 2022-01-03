import numpy as np
import pandas as pd
from icecream import ic
import psycopg2
from tabulate import tabulate
import consul
import argparse


def consul_get(key, host='127.0.0.1', port=8500):
    c = consul.Consul(host=host, port=port)
    _, data = c.kv.get(key)
    return data


def main(consul_host=None):
    rng = np.random.default_rng()
    df = pd.DataFrame(rng.integers(0, 100, size=(100, 4)), columns=list('ABCD'))
    print(tabulate(df, tablefmt='pretty'))
    if consul_host is not None:
        ic(consul_get('test', host=consul_host))
    else:
        ic(consul_get('test'))

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument(
        '--consul_host',
        type=str
    )

    FLAGS = parser.parse_args()

    flags = vars(FLAGS)
    main(**flags)

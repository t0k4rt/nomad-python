import numpy as np
import pandas as pd
from icecream import ic
import psycopg2
from tabulate import tabulate

rng = np.random.default_rng()
df = pd.DataFrame(rng.integers(0, 100, size=(100, 4)), columns=list('ABCD'))
ic(df.head())
print(tabulate(df, tablefmt='pretty'))


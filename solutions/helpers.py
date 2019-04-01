def display(spark_df, limit=5):
    return spark_df.limit(limit).toPandas()


def write_df(df, name):
    (
        df
        .write
        .format('parquet')
        .mode('overwrite')
        .option('compression', 'gzip')
        .save(name)
    )


def read_df(spark, name):
    return (
        spark
        .read
        .format('parquet')
        .load(name)
    )


def partition_counts(ind, iterator):
    count = 0
    for _ in iterator:
        count += 1
    return [(ind, count)]


def check_split(train, test, total):
    n_train = train.count()
    n_test = test.count()
    n_total = total.count()
    if n_train + n_test == n_total:
        print('Great! Counts of rows look good.')
    else:
        print(
            'wait, {} + {} does not equal {}!'
            .format(n_train, n_test, n_total)
        )


def feature_importances(train, model, n=20):
    feature_types = train.schema['features'].metadata['ml_attr']['attrs']
    feature_col_names = []
    if 'nominal' in feature_types.keys():
        feature_col_names.extend(
            [i['name'] for i in train.schema['features'].metadata['ml_attr']['attrs']['nominal']]
        )
    if 'numeric' in feature_types.keys():
        feature_col_names.extend(
            [j['name'] for j in train.schema['features'].metadata['ml_attr']['attrs']['numeric']]
        )

    importances = sorted(zip(model.featureImportances.values, model.featureImportances.indices), reverse=True)
    for val, i in importances[0:n]:
        print('{0}: {1:.3f}'.format(feature_col_names[i], val))

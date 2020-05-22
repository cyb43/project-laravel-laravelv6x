<?php


/**
 * ^2_3^ 队列配置
 * https://learnku.com/docs/laravel/6.x/queues/5168
 */
return [

    /*
    |--------------------------------------------------------------------------
    | Default Queue Connection Name
    |--------------------------------------------------------------------------
    |
    | Laravel's queue API supports an assortment of(各式各样的) back-ends via a single
    | API, giving you convenient(方便的) access to each back-end using the same
    | syntax for every one. Here you may define a default connection.
    | 支持 数据库， Beanstalkd, Amazon SQS, Redis，以及同步(本地使用)驱动，还有null 队列驱动用于那些放弃队列的任务。
    |
    */

    'default' => env('QUEUE_CONNECTION', 'sync'),

    /*
    |--------------------------------------------------------------------------
    | Queue Connections
    |--------------------------------------------------------------------------
    |
    | Here you may configure the connection information for each server that
    | is used by your application. A default configuration has been added
    | for each back-end shipped with Laravel. You are free to add more.
    |
    | Drivers: "sync", "database", "beanstalkd", "sqs", "redis", "null"
    |
    */

    'connections' => [
        //
        // 同步(本地使用)驱动
        'sync' => [
            'driver' => 'sync',
        ],
        //
        //// ^2_3^ 数据库
        /// 配置任务队列表
        // php artisan queue:table
        // php artisan migrate
        'database' => [
            'driver' => 'database',
            'table' => 'jobs',
            'queue' => 'default',
            'retry_after' => 90, //执行90秒后将会被放回队列而不是删除它;
        ],
        //
        // beanstalkd
        'beanstalkd' => [
            'driver' => 'beanstalkd',
            'host' => 'localhost',
            'queue' => 'default',
            'retry_after' => 90,
            'block_for' => 0,
        ],
        //
        // sqs
        'sqs' => [
            'driver' => 'sqs',
            'key' => env('AWS_ACCESS_KEY_ID'),
            'secret' => env('AWS_SECRET_ACCESS_KEY'),
            'prefix' => env('SQS_PREFIX', 'https://sqs.us-east-1.amazonaws.com/your-account-id'),
            'queue' => env('SQS_QUEUE', 'your-queue-name'),
            'region' => env('AWS_DEFAULT_REGION', 'us-east-1'),
        ],
        //
        // ^2_3^ redis
        'redis' => [
            'driver' => 'redis',
            'connection' => 'default',
            'queue' => env('REDIS_QUEUE', 'default'),
            'retry_after' => 90,
            'block_for' => null, //应该在将任务重新放入 Redis 数据库以及处理器轮询之前阻塞多久。
        ],

    ],

    /*
    |--------------------------------------------------------------------------
    | Failed Queue Jobs
    |--------------------------------------------------------------------------
    |
    | These options configure the behavior of failed queue job logging so you
    | can control which database and table are used to store the jobs that
    | have failed. You may change them to any database / table you wish.
    |
    */
    // 队列任务失败数据表
    'failed' => [
        'driver' => env('QUEUE_FAILED_DRIVER', 'database'),
        'database' => env('DB_CONNECTION', 'mysql'),
        'table' => 'failed_jobs',
    ],

];

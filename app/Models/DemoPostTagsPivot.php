<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;


/**
 * 文章标签关联
 * php artisan make:model /Models/DemoPostTagsPivot
 *
 * Class DemoPostTagsPivot
 * @package App\Models
 * @author ^2_3^王尔贝
 */
class DemoPostTagsPivot extends Model
{
    /**
     * 可批量赋值字段
     * @var array
     * @author ^2_3^王尔贝
     */
    protected $fillable = [
        'post_id', 'tag_id'
    ];

    /**
     * 类型
     * @var array
     * @author ^2_3^王尔贝
     */
    protected $casts = [

    ];

    /**
     * 模型日期列的存储格式。
     * 零时区时间戳(int)
     * @var string
     */
    protected $dateFormat = 'U';
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;


/**
 * 文章内容
 * Class DemoPostsContent
 * @package App\Models
 * @author ^2_3^王尔贝
 */
class DemoPostsContent extends Model
{
    /**
     * 可批量赋值字段
     * @var array
     * @author ^2_3^王尔贝
     */
    protected $fillable = [
        'post_id', 'content'
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

    /**
     * [一对一_反向关联]
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     * @author ^2_3^王尔贝
     */
    public function demoPost()
    {
        return $this->belongsTo('App\Models\DemoPost', 'post_id', 'id');
    }
}

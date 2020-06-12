<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;


/**
 * 文章标签
 * Class DemoPostTag
 * @package App\Models
 * @author ^2_3^王尔贝
 */
class DemoPostTag extends Model
{
    /**
     * 可批量赋值字段
     * @var array
     * @author ^2_3^王尔贝
     */
    protected $fillable = [
        'tag_name'
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
     * [多对多_反向关联]所属角色文章
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     * @author ^2_3^王尔贝
     */
    public function demoPosts()
    {
        return $this->belongsToMany(
            'App\Models\DemoPost',
            'demo_post_tags_pivots',
            'tag_id',
            'post_id');
    }
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;


/**
 * 示例文章模型
 * Class DemoPost
 * @package App\Models
 * @author ^2_3^王尔贝
 */
class DemoPost extends Model
{
    /**
     * 可批量赋值字段
     * @var array
     * @author ^2_3^王尔贝
     */
    protected $fillable = [
        'title'
    ];

    /**
     * 类型
     * 将属性转换为常见的数据类型。
     * $casts 属性应是一个数组，且数组的键是那些需要被转换的属性名称，值则是你希望转换的数据类型。
     * 支持转换的数据类型有：integer，real，float，double，decimal:<digits>，string，boolean，object，
     * array，collection，date，datetime，和 timestamp。
     * 当需要转换为 decimal 类型时，你需要定义小数位的个数，如： decimal:2。
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
     * [一对一]文章内容
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     * @author ^2_3^王尔贝
     */
    public function demoPostsContent()
    {
        return $this->hasOne('App\Models\DemoPostsContent', 'post_id', 'id');
    }

    /**
     * [一对多]文章评论
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     * @author ^2_3^王尔贝
     */
    public function demoPostComments()
    {
        return $this->hasMany('App\Models\DemoPostComment', 'post_id', 'id');
    }

    /**
     * [多对多]文章标签关联
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     * @author ^2_3^王尔贝
     */
    public function demoPostTags()
    {
        return $this->belongsToMany(
            'App\Models\DemoPostTag',
            'demo_post_tags_pivots',
            'post_id',
            'tag_id'
        );
    }

}

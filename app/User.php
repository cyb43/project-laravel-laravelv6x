<?php

namespace App;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens;
use Illuminate\Database\Eloquent\SoftDeletes;


/**
 * ^2_3^ 用户模型
 * Class User
 * @package App
 */
class User extends Authenticatable
{
    // HasApiTokens #Passport OAuth 认证;
    // Notifiable #通知trait;
    use HasApiTokens
        , Notifiable
        //, SoftDeletes
        ;

    /**
     * 模型事件映射
     *
     * @var array
     */
//    protected $dispatchesEvents = [
//        'saved' => UserSaved::class,
//        'deleted' => UserDeleted::class,
//    ];

    /**
     * 可批量赋值字段
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];
}

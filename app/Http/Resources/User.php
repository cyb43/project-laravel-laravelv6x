<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;


/**
 * API资源_用户资源
 * 需要一个转换层来联结 Eloquent 模型和实际返回给用户的 JSON 响应。
 * Class User
 * @package App\Http\Resources
 * @author ^2_3^王尔贝
 */
class User extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return parent::toArray($request);

//        return [
//            'id' => $this->id,
//            'name' => $this->name,
//            'email' => $this->email,
//            'email_verified_at' => $this->email_verified_at,
//            'created_at' => $this->created_at,
//            'updated_at' => $this->updated_at
//        ];
    }
}

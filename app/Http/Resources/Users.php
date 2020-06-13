<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;


/**
 * API资源_用户集合资源
 * Class Users
 * @package App\Http\Resources
 * @author ^2_3^王尔贝
 */
class Users extends ResourceCollection
{
    /**
     * Transform the resource collection into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        //return parent::toArray($request);

        return [
            'data' => $this->collection,
            'links' => [
                'self' => 'link-value',
            ],
        ];

    }
}

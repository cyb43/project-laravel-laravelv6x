<?php

//namespace Laravel\Passport\Events;


/**
 * ^2_3^ 刷新令牌创建事件(20200519)
 * Class RefreshTokenCreated
 * @package Laravel\Passport\Events
 */
class RefreshTokenCreated
{
    /**
     * The newly created refresh token ID.
     *
     * @var string
     */
    public $refreshTokenId;

    /**
     * The access token ID.
     *
     * @var string
     */
    public $accessTokenId;

    /**
     * Create a new event instance.
     *
     * @param  string  $refreshTokenId
     * @param  string  $accessTokenId
     * @return void
     */
    public function __construct($refreshTokenId, $accessTokenId)
    {
        $this->accessTokenId = $accessTokenId;
        $this->refreshTokenId = $refreshTokenId;
    }
}

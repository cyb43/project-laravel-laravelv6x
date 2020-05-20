<?php

//namespace Illuminate\Foundation;

use Illuminate\Support\Collection;


/**
 * ^2_3^令人鼓舞语录(20200520)
 * Class Inspiring
 * @package Illuminate\Foundation
 */
class Inspiring
{
    /**
     * Get an inspiring quote.
     *
     * Taylor & Dayle made this commit from Jungfraujoch. (11,333 ft.)
     *
     * May McGinnis always control the board. #LaraconUS2015
     *
     * RIP Charlie - Feb 6, 2018
     *
     * @return string
     */
    public static function quote()
    {
        return Collection::make([
            'When there is no desire, all things are at peace.(当没有欲望时，一切都是平静的。) - Laozi',
            'Simplicity is the ultimate sophistication. - Leonardo da Vinci (简单是最复杂的。——达芬奇)',
            'Simplicity is the essence of happiness. - Cedric Bledsoe (简单是幸福的本质。--塞德里克·布莱索)',
            'Smile, breathe, and go slowly. - Thich Nhat Hanh (微笑，深呼吸，慢慢来。--一行禅师)',
            'Simplicity is an acquired taste. - Katharine Gerould (简朴是一种后天养成的爱好。--凯瑟琳·格劳德)',
            'Well begun is half done. - Aristotle (好的开始是成功的一半。——亚里士多德)',
            'He who is contented is rich. - Laozi (知足者富。——老子)',
            'Very little is needed to make a happy life. - Marcus Antoninus (幸福生活所需的东西很少。--马库斯-安东尼)',
            'It is quality rather than quantity that matters. - Lucius Annaeus Seneca (重要的是质量而不是数量。--西尼加)',
            'Act only according to that maxim whereby you can, at the same time, will that it should become a universal law. - Immanuel Kant (只有根据这一格律行事，你才能同时使它成为一种普遍的法则。——康德)',
            'Knowing is not enough; we must apply. Being willing is not enough; we must do. - Leonardo da Vinci (知道是不够的，我们必须适用。光有意愿是不够的，我们必须做的。——达芬奇)',
            'An unexamined life is not worth living. - Socrates (混混噩噩的生活不值得过。——苏格拉底)',
            'Happiness is not something readymade. It comes from your own actions. - Dalai Lama (幸福不是现成的东西。它来自于你自己的行为。——达赖喇嘛)',
            'The only way to do great work is to love what you do. - Steve Jobs (成就一番伟业的唯一途径就是热爱自己的事业。——史蒂夫•乔布斯)',
            'The whole future lies in uncertainty: live immediately. - Seneca (整个未来都充满了不确定性：立即生活。——塞内加)',
            'Waste no more time arguing what a good man should be, be one. - Marcus Aurelius (不要再浪费时间争论什么是一个好男人，做一个好男人。--马可·奥里利乌斯)',
            'It is not the man who has too little, but the man who craves more, that is poor. - Seneca (穷人并不是拥有太少的人，而是渴望更多的人。——塞内加)',
            'I begin to speak only when I am certain what I will say is not better left unsaid - Cato the Younger (只有当我确定我要说的话还是不说为妙时，我才开始说话。——小加图)',
            'Order your soul. Reduce your wants. - Augustine (凝练你的灵魂，减少你的欲望。--奥古斯汀)',
            'Be present above all else. - Naval Ravikant (首先要在场。--纳瓦尔-列韦康德)',
            'Let all your things have their places; let each part of your business have its time. - Benjamin Franklin (让你所有的东西都能够各就其位，让你的每一部分业务都有自己的时间。--本杰明·富兰克林)',
            'If you do not have a consistent goal in life, you can not live it in a consistent way. - Marcus Aurelius (如果你在生活中没有一个一致的目标，你就不能以一致的方式生活。--马可·奥里利乌斯)',
            'No surplus words or unnecessary actions. - Marcus Aurelius (没有多余的言语和不必要的行动。--马可·奥里利乌斯)',
            'People find pleasure in different ways. I find it in keeping my mind clear. - Marcus Aurelius (人们找到快乐的方式各不相同。我发现这是为了保持头脑清醒。--马库斯·奥里利乌斯)',
        ])->random();
    }
}

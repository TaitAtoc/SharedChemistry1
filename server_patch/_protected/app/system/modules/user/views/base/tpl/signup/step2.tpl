<div class="col-md-8 sharedchemistry-signup-step2">
    <section
        class="sharedchemistry-step-intro"
        style="background:#17181d;border:1px solid #34363f;border-radius:12px;padding:26px 28px;margin:0 0 18px;color:#f7f3ef;box-shadow:0 18px 44px rgba(0,0,0,.22);"
    >
        <h2 style="margin:0 0 8px;font-size:28px;line-height:1.2;font-weight:700;color:#fff;">Complete your couple profile</h2>
        <p style="margin:0;color:#d7d2ce;font-size:15px;line-height:1.6;">Start with the basics. Partner details and shared preferences will be added next.</p>
    </section>

    <section
        class="sharedchemistry-step-card"
        style="background:#17181d;border:1px solid #34363f;border-radius:12px;padding:22px 24px 26px;margin:0 0 24px;color:#f7f3ef;box-shadow:0 18px 44px rgba(0,0,0,.2);"
    >
        {include 'progressbar.inc.tpl'}
        {{ JoinForm::step2() }}
    </section>
</div>

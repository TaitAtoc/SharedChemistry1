<style>
    .sharedchemistry-signup-wrap {
        float: none;
        margin-left: auto;
        margin-right: auto;
    }

    .sharedchemistry-step-intro,
    .sharedchemistry-step-card {
        background: #17181d;
        border: 1px solid #34363f;
        border-radius: 12px;
        color: #f7f3ef;
        box-shadow: 0 18px 44px rgba(0, 0, 0, .2);
    }

    .sharedchemistry-step-intro {
        padding: 28px 32px;
        margin: 0 0 18px;
    }

    .sharedchemistry-step-card {
        padding: 24px 30px 30px;
        margin: 0 auto 24px;
    }

    .sharedchemistry-step-card .radio,
    .sharedchemistry-step-card .checkbox {
        background: rgba(255, 255, 255, .06);
        border: 1px solid rgba(255, 255, 255, .1);
        border-radius: 8px;
        padding: 10px 12px;
        margin: 8px 0;
    }

    .sharedchemistry-step-card label {
        cursor: pointer;
    }
</style>

<div class="col-md-10 sharedchemistry-signup-wrap sharedchemistry-signup-step3">
    <section
        class="sharedchemistry-step-intro"
    >
        <h2 style="margin:0 0 8px;font-size:28px;line-height:1.2;font-weight:700;color:#fff;">Tell couples about yourselves</h2>
        <p style="margin:0;color:#d7d2ce;font-size:15px;line-height:1.6;">Write a short couple profile. Keep it real, warm, and clear.</p>
    </section>

    <section
        class="sharedchemistry-step-card"
    >
        {include 'progressbar.inc.tpl'}
        {{ JoinForm::step3() }}
    </section>
</div>

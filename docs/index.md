---
layout: splash
permalink: /
header:
  overlay_color: "#222"
  overlay_filter: "0.5"
  overlay_image: /assets/images/azure-banner.jpg
  actions:
    - label: "View Projects"
      url: "{{ site.baseurl }}/projects/"
    - label: "Contact Me"
      url: "{{ site.baseurl }}/contact/"
excerpt: "A seasoned Cloud Engineer specializing in enterprise-scale Azure architectures and Infrastructure as Code (IaC)."

feature_row:
  - image_path: /assets/images/landing-zone-thumb.jpg
    alt: "Azure Landing Zone"
    title: "Enterprise Landing Zone Implementation"
    excerpt: "Design and implementation of scalable, secure Azure environments using Microsoft's latest enterprise-scale patterns."
    url: "{{ site.baseurl }}/projects/landing_zone/"
    btn_label: "Learn More"
    btn_class: "btn--primary"
  - image_path: /assets/images/avm-thumb.jpg
    alt: "Azure Verified Modules"
    title: "Azure Verified Modules Implementation"
    excerpt: "Custom contributions to the AVM community with implementation examples and governance frameworks."
    url: "{{ site.baseurl }}/projects/avm_implementations/"
    btn_label: "Learn More"
    btn_class: "btn--primary"  - image_path: /assets/images/security-thumb.jpg
    alt: "Cloud Security"
    title: "Cloud Security Frameworks"
    excerpt: "Zero Trust architecture implementations, security baseline automation, and compliance reporting."
    url: "{{ site.baseurl }}/projects/security_frameworks/"
    btn_label: "Learn More"
    btn_class: "btn--primary"

certification_row:
  - image_path: /assets/images/azure-solutions-architect.png
    alt: "Azure Solutions Architect"
    title: "Azure Solutions Architect Expert"
  - image_path: /assets/images/azure-devops-engineer.png
    alt: "Azure DevOps Engineer"
    title: "Azure DevOps Engineer Expert"
  - image_path: /assets/images/azure-security-engineer.png
    alt: "Azure Security Engineer"
    title: "Azure Security Engineer Associate"
  - image_path: /assets/images/terraform-associate.png
    alt: "Terraform Associate"
    title: "HashiCorp Terraform Associate"
  - image_path: /assets/images/cissp.png
    alt: "CISSP"
    title: "Certified Information Systems Security Professional"
---

{% include feature_row %}

## What I Do

I help organizations build and implement secure, scalable, and efficient Azure cloud environments using infrastructure as code and DevOps best practices.

<div class="grid__wrapper">
  <div class="grid__item">
    <div class="archive__item">
      <div class="archive__item-body">
        <h3 class="archive__item-title">Azure Landing Zones</h3>
        <div class="archive__item-excerpt">
          <p>Enterprise-scale architecture design and implementation ensuring secure, compliant cloud foundations.</p>
        </div>
      </div>
    </div>
  </div>
  <div class="grid__item">
    <div class="archive__item">
      <div class="archive__item-body">
        <h3 class="archive__item-title">Infrastructure as Code</h3>
        <div class="archive__item-excerpt">
          <p>Version-controlled, tested, and automated infrastructure deployment using Bicep and Terraform.</p>
        </div>
      </div>
    </div>
  </div>
  <div class="grid__item">
    <div class="archive__item">
      <div class="archive__item-body">
        <h3 class="archive__item-title">Cloud Governance</h3>
        <div class="archive__item-excerpt">
          <p>Policy as code implementation for automated compliance and security controls across environments.</p>
        </div>
      </div>
    </div>
  </div>
  <div class="grid__item">
    <div class="archive__item">
      <div class="archive__item-body">
        <h3 class="archive__item-title">DevSecOps</h3>
        <div class="archive__item-excerpt">
          <p>Integration of security into CI/CD pipelines with automated testing and validation.</p>
        </div>
      </div>
    </div>
  </div>
</div>

## Latest Blog Posts

<div class="grid__wrapper">
  {% for post in site.posts limit:3 %}
    {% include archive-single.html type="grid" %}
  {% endfor %}
</div>

<a href="{{ site.baseurl }}/blog/" class="btn btn--primary">View All Posts</a>

## Certifications & Achievements

<div class="certification-grid">
  {% for item in page.certification_row %}
    <div class="certification-item">
      <img src="{{ item.image_path | relative_url }}" alt="{{ item.alt }}" class="certification-image">
      <p class="certification-title">{{ item.title }}</p>
    </div>
  {% endfor %}
</div>

<a href="{{ site.baseurl }}/certifications/" class="btn btn--primary">View All Certifications</a>

## Let's Connect

<div class="text-center">
  <a href="{{ site.baseurl }}/contact/" class="btn btn--success btn--large">Contact Me</a>
  <a href="https://calendly.com/your-calendly-link" class="btn btn--info btn--large">Schedule a Meeting</a>
</div>

## Repository Structure
```
NatsCloudPlayground/
├── .git/                    # Git version control files
├── .vscode/                 # VSCode workspace settings (optional)
├── docs/                    # GitHub Pages website content root (served via /docs)
│   ├── blog/                # Technical articles and insights
│   ├── presentations/       # Conference talks and demonstration materials
│   ├── certifications/      # Professional certifications and achievements
│   ├── timeline/            # Professional development journey
│   └── index.md             # Main landing page (this file)
├── projects/                # Featured cloud projects with code samples
│   ├── landing_zone.md      # Example project detail file
│   ├── avm_implementations.md # Example project detail file
│   ├── security_frameworks.md # Example project detail file
│   └── alz_bicep/           # Example project (potentially submodule)
├── scripts/                 # Utility scripts, non-website code
└── NatsCloudPlayground.code-workspace # VSCode workspace file (optional)
```

## Professional Timeline
[View my professional journey →]({{ site.baseurl }}/timeline/)

## Technical Blog
[Read my technical insights →]({{ site.baseurl }}/blog/)

## Project Contributions
Interested in my open-source and community contributions? Check out:
- [Azure Verified Modules](https://github.com/Azure/Azure-Verified-Modules)
- [Azure Landing Zones](https://github.com/Azure/Enterprise-Scale)

## Contact
[Professional contact details]

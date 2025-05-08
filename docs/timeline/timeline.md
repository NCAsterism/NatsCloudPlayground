---
layout: single
title: "Professional Timeline"
permalink: /timeline/
classes: wide
author_profile: true
header:
  overlay_color: "#000"
  overlay_filter: "0.5"
  overlay_image: /assets/images/timeline-banner.jpg # Placeholder, replace with actual image
---

# Professional Journey

This timeline showcases key milestones in my professional career, highlighting significant cloud architecture and infrastructure projects.

<div class="timeline">
  <div class="timeline-item">
    <div class="timeline-marker">2025</div>
    <div class="timeline-content">
      <h3>Lead Cloud Architect</h3>
      <p class="timeline-subtitle">Fortune 500 Financial Services Company</p>
      <ul>
        <li>Led design and implementation of enterprise-scale Azure landing zone supporting 1000+ workloads</li>
        <li>Reduced deployment time by 40% through automated infrastructure pipelines</li>
        <li>Implemented modern governance framework reducing security incidents by 50%</li>
        <li>Mentored team of 8 cloud engineers on Azure best practices and IaC development</li>
      </ul>
    </div>
  </div>
  
  <div class="timeline-item">
    <div class="timeline-marker">2023</div>
    <div class="timeline-content">
      <h3>Senior Azure Cloud Engineer</h3>
      <p class="timeline-subtitle">Global Healthcare Organization</p>
      <ul>
        <li>Architected and deployed multi-region hybrid cloud connectivity solution</li>
        <li>Designed and implemented cloud governance framework with policy as code</li>
        <li>Led migration of 100+ applications to Azure with zero downtime</li>
        <li>Established CI/CD practices using GitHub Actions and Azure DevOps</li>
      </ul>
    </div>
  </div>
  
  <div class="timeline-item">
    <div class="timeline-marker">2021</div>
    <div class="timeline-content">
      <h3>Cloud Infrastructure Engineer</h3>
      <p class="timeline-subtitle">Tech Startup</p>
      <ul>
        <li>Built containerized application platform on AKS</li>
        <li>Implemented infrastructure as code using Terraform and Bicep</li>
        <li>Designed and deployed multi-tenant SaaS architecture</li>
        <li>Reduced cloud costs by 35% through rightsizing and automation</li>
      </ul>
    </div>
  </div>
  
  <div class="timeline-item">
    <div class="timeline-marker">2019</div>
    <div class="timeline-content">
      <h3>Systems Engineer</h3>
      <p class="timeline-subtitle">Retail Corporation</p>
      <ul>
        <li>Managed on-premises infrastructure and began cloud migration planning</li>
        <li>Implemented backup and disaster recovery solutions</li>
        <li>Led proof-of-concept projects for cloud adoption</li>
        <li>Automated routine maintenance tasks using PowerShell</li>
      </ul>
    </div>
  </div>
</div>

## Certifications & Professional Development

<div class="timeline timeline-alt">
  <div class="timeline-item">
    <div class="timeline-marker">2024</div>
    <div class="timeline-content">
      <h3>Certifications</h3>
      <ul>
        <li>CISSP (Certified Information Systems Security Professional)</li>
        <li>Azure Solutions Architect Expert (Renewal)</li>
      </ul>
    </div>
  </div>
  
  <div class="timeline-item">
    <div class="timeline-marker">2023</div>
    <div class="timeline-content">
      <h3>Certifications & Presentations</h3>
      <ul>
        <li>Azure DevOps Engineer Expert</li>
        <li>Speaker at Microsoft Azure Summit - "Enterprise Scale Landing Zones in Practice"</li>
      </ul>
    </div>
  </div>
  
  <div class="timeline-item">
    <div class="timeline-marker">2022</div>
    <div class="timeline-content">
      <h3>Certifications</h3>
      <ul>
        <li>Azure Security Engineer Associate</li>
        <li>HashiCorp Terraform Associate</li>
      </ul>
    </div>
  </div>
  
  <div class="timeline-item">
    <div class="timeline-marker">2021</div>
    <div class="timeline-content">
      <h3>Certifications</h3>
      <ul>
        <li>Azure Solutions Architect Expert</li>
        <li>Azure Administrator Associate</li>
      </ul>
    </div>
  </div>
</div>

<style>
.timeline {
  position: relative;
  margin: 3em 0;
  max-width: 1000px;
}

.timeline:before {
  content: '';
  position: absolute;
  top: 0;
  left: 20px;
  height: 100%;
  width: 4px;
  background: var(--azure-blue, #0078d4);
}

.timeline-item {
  position: relative;
  padding-left: 60px;
  margin-bottom: 2.5em;
}

.timeline-marker {
  position: absolute;
  left: 0;
  top: 0;
  width: 40px;
  height: 40px;
  border-radius: 50%;
  background: var(--azure-blue, #0078d4);
  color: white;
  text-align: center;
  line-height: 40px;
  font-weight: bold;
  z-index: 1;
}

.timeline-content {
  background: #f5f5f5; /* Light background for content boxes */
  padding: 1.5em;
  border-radius: 8px;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

/* Apply dark theme adjustments if the body has a dark theme class from Minimal Mistakes */
body.dark-theme .timeline-content {
  background: #333; /* Darker background for content boxes in dark mode */
  color: #eee; /* Lighter text for dark mode */
}

body.dark-theme .timeline-content h3 {
  color: var(--azure-blue, #00a1f1); /* Ensure heading color is visible in dark mode */
}

.timeline-content h3 {
  margin-top: 0;
  color: var(--azure-blue, #0078d4);
}

.timeline-subtitle {
  font-style: italic;
  margin-top: -0.5em;
  margin-bottom: 1em;
}

.timeline-alt .timeline-content {
  background: #e9f4fe; /* Slightly different background for alternate timeline sections */
}

body.dark-theme .timeline-alt .timeline-content {
  background: #2a2a2a; /* Darker alternate background */
}

@media (max-width: 768px) {
  .timeline-item {
    padding-left: 50px;
  }
  
  .timeline:before {
    left: 18px;
  }
  
  .timeline-marker {
    width: 36px;
    height: 36px;
    line-height: 36px;
  }
}
</style>
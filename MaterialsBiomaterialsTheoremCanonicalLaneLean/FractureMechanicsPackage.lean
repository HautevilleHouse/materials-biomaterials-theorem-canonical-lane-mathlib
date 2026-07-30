import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsBiomaterialsTheoremCanonicalLaneLean

structure FractureMechanicsPackage (C : CrystalStructurePackage) (E : ElasticityPackage C) where
  criticalStressIntensity : ℝ
  fractureToughness : ℝ
  crackTipStressField : Type u
  energyReleaseRate : ℝ
  fractureCriterion : Prop
  criticalStressIntensityCalculated : Prop
  fractureToughnessValid : Prop

structure FractureMechanicsEvidence (C : CrystalStructurePackage) (E : ElasticityPackage C) (F : FractureMechanicsPackage C E) where
  criticalStressIntensityCalculatedClosed : F.criticalStressIntensityCalculated
  fractureToughnessValidClosed : F.fractureToughnessValid
  fractureCriterionClosed : F.fractureCriterion

def FractureMechanicsClosed (C : CrystalStructurePackage) (E : ElasticityPackage C) (F : FractureMechanicsPackage C E) : Prop :=
  F.criticalStressIntensityCalculated ∧ F.fractureToughnessValid ∧ F.fractureCriterion

theorem fracture_mechanics_closed_from_evidence
    (C : CrystalStructurePackage) (E : ElasticityPackage C) (F : FractureMechanicsPackage C E) (Ev : FractureMechanicsEvidence C E F) :
    FractureMechanicsClosed C E F := by
  exact And.intro Ev.criticalStressIntensityCalculatedClosed
    (And.intro Ev.fractureToughnessValidClosed Ev.fractureCriterionClosed)

end HautevilleHouse
end MaterialsBiomaterialsTheoremCanonicalLaneLean
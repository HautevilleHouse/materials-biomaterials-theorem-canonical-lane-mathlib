import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsBiomaterialsTheoremCanonicalLaneLean

structure FracturePackage where
  crackLength : Float
  appliedStress : Float
  fractureToughness : Float
  energyReleaseRate : Float
  griffithCriterion : Prop
  criticalStressIntensityFactor : Float
  stressIntensityFactorCalculated : Float

structure FractureEvidence (F : FracturePackage) where
  griffithCriterionClosed : F.griffithCriterion
  stressIntensityFactorPositive : F.stressIntensityFactorCalculated > 0

def FractureClosed (F : FracturePackage) : Prop :=
  F.griffithCriterion ∧ F.stressIntensityFactorCalculated > 0

theorem fracture_closed_from_evidence (F : FracturePackage) (E : FractureEvidence F) : FractureClosed F := by
  exact And.intro E.griffithCriterionClosed E.stressIntensityFactorPositive

end MaterialsBiomaterialsTheoremCanonicalLaneLean
end HautevilleHouse
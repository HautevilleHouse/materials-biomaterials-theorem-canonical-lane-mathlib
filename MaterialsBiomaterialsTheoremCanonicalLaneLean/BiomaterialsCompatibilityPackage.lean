import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsBiomaterialsTheoremCanonicalLaneLean

structure BiomaterialsCompatibilityPackage {C : CrystalStructurePackage} {E : ElasticityPackage C} {F : FractureMechanicsPackage C E} where
  biocompatibilityCriteria : Prop
  cellularResponse : Type u
  immuneRejectionProbability : ℝ
  degradationRate : ℝ
  biocompatibilityCriteriaMet : Prop
  cellularResponseModeled : Prop

structure BiomaterialsCompatibilityEvidence {C : CrystalStructurePackage} {E : ElasticityPackage C} {F : FractureMechanicsPackage C E}
    (B : BiomaterialsCompatibilityPackage C E F) where
  biocompatibilityCriteriaMetClosed : B.biocompatibilityCriteriaMet
  cellularResponseModeledClosed : B.cellularResponseModeled

def BiomaterialsCompatibilityClosed {C : CrystalStructurePackage} {E : ElasticityPackage C} {F : FractureMechanicsPackage C E}
    (B : BiomaterialsCompatibilityPackage C E F) : Prop :=
  B.biocompatibilityCriteriaMet ∧ B.cellularResponseModeled

theorem biomaterials_compatibility_closed_from_evidence
    {C : CrystalStructurePackage} {E : ElasticityPackage C} {F : FractureMechanicsPackage C E}
    (B : BiomaterialsCompatibilityPackage C E F) (Ev : BiomaterialsCompatibilityEvidence C E F B) :
    BiomaterialsCompatibilityClosed B := by
  exact And.intro Ev.biocompatibilityCriteriaMetClosed Ev.cellularResponseModeledClosed

end HautevilleHouse
end MaterialsBiomaterialsTheoremCanonicalLaneLean